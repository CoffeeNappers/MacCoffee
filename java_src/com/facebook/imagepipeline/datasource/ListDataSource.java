package com.facebook.imagepipeline.datasource;

import com.facebook.common.executors.CallerThreadExecutor;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.references.CloseableReference;
import com.facebook.datasource.AbstractDataSource;
import com.facebook.datasource.DataSource;
import com.facebook.datasource.DataSubscriber;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CancellationException;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
/* loaded from: classes.dex */
public class ListDataSource<T> extends AbstractDataSource<List<CloseableReference<T>>> {
    private final DataSource<CloseableReference<T>>[] mDataSources;
    @GuardedBy("this")
    private int mFinishedDataSources = 0;

    protected ListDataSource(DataSource<CloseableReference<T>>[] dataSources) {
        this.mDataSources = dataSources;
    }

    public static <T> ListDataSource<T> create(DataSource<CloseableReference<T>>... dataSources) {
        Preconditions.checkNotNull(dataSources);
        Preconditions.checkState(dataSources.length > 0);
        ListDataSource<T> listDataSource = new ListDataSource<>(dataSources);
        for (DataSource<CloseableReference<T>> dataSource : dataSources) {
            if (dataSource != null) {
                listDataSource.getClass();
                dataSource.subscribe(new InternalDataSubscriber(), CallerThreadExecutor.getInstance());
            }
        }
        return listDataSource;
    }

    @Override // com.facebook.datasource.AbstractDataSource, com.facebook.datasource.DataSource
    @Nullable
    /* renamed from: getResult  reason: collision with other method in class */
    public synchronized List<CloseableReference<T>> mo479getResult() {
        List<CloseableReference<T>> results;
        DataSource<CloseableReference<T>>[] dataSourceArr;
        if (!hasResult()) {
            results = null;
        } else {
            results = new ArrayList<>(this.mDataSources.length);
            for (DataSource<CloseableReference<T>> dataSource : this.mDataSources) {
                results.add(dataSource.mo479getResult());
            }
        }
        return results;
    }

    @Override // com.facebook.datasource.AbstractDataSource, com.facebook.datasource.DataSource
    public synchronized boolean hasResult() {
        boolean z;
        if (!isClosed()) {
            if (this.mFinishedDataSources == this.mDataSources.length) {
                z = true;
            }
        }
        z = false;
        return z;
    }

    @Override // com.facebook.datasource.AbstractDataSource, com.facebook.datasource.DataSource
    public boolean close() {
        DataSource<?>[] dataSourceArr;
        if (!super.close()) {
            return false;
        }
        for (DataSource<?> dataSource : this.mDataSources) {
            dataSource.close();
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onDataSourceFinished() {
        if (increaseAndCheckIfLast()) {
            setResult(null, true);
        }
    }

    private synchronized boolean increaseAndCheckIfLast() {
        int i;
        i = this.mFinishedDataSources + 1;
        this.mFinishedDataSources = i;
        return i == this.mDataSources.length;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onDataSourceFailed(DataSource<CloseableReference<T>> dataSource) {
        setFailure(dataSource.getFailureCause());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onDataSourceCancelled() {
        setFailure(new CancellationException());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onDataSourceProgress() {
        DataSource<?>[] dataSourceArr;
        float progress = 0.0f;
        for (DataSource<?> dataSource : this.mDataSources) {
            progress += dataSource.getProgress();
        }
        setProgress(progress / this.mDataSources.length);
    }

    /* loaded from: classes.dex */
    private class InternalDataSubscriber implements DataSubscriber<CloseableReference<T>> {
        @GuardedBy("InternalDataSubscriber.this")
        boolean mFinished;

        private InternalDataSubscriber() {
            this.mFinished = false;
        }

        private synchronized boolean tryFinish() {
            boolean z = true;
            synchronized (this) {
                if (this.mFinished) {
                    z = false;
                } else {
                    this.mFinished = true;
                }
            }
            return z;
        }

        @Override // com.facebook.datasource.DataSubscriber
        public void onFailure(DataSource<CloseableReference<T>> dataSource) {
            ListDataSource.this.onDataSourceFailed(dataSource);
        }

        @Override // com.facebook.datasource.DataSubscriber
        public void onCancellation(DataSource<CloseableReference<T>> dataSource) {
            ListDataSource.this.onDataSourceCancelled();
        }

        @Override // com.facebook.datasource.DataSubscriber
        public void onNewResult(DataSource<CloseableReference<T>> dataSource) {
            if (dataSource.isFinished() && tryFinish()) {
                ListDataSource.this.onDataSourceFinished();
            }
        }

        @Override // com.facebook.datasource.DataSubscriber
        public void onProgressUpdate(DataSource<CloseableReference<T>> dataSource) {
            ListDataSource.this.onDataSourceProgress();
        }
    }
}
