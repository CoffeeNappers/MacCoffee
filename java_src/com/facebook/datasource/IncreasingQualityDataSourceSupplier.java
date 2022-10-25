package com.facebook.datasource;

import com.facebook.common.executors.CallerThreadExecutor;
import com.facebook.common.internal.Objects;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Supplier;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;
@ThreadSafe
/* loaded from: classes.dex */
public class IncreasingQualityDataSourceSupplier<T> implements Supplier<DataSource<T>> {
    private final List<Supplier<DataSource<T>>> mDataSourceSuppliers;

    private IncreasingQualityDataSourceSupplier(List<Supplier<DataSource<T>>> dataSourceSuppliers) {
        Preconditions.checkArgument(!dataSourceSuppliers.isEmpty(), "List of suppliers is empty!");
        this.mDataSourceSuppliers = dataSourceSuppliers;
    }

    public static <T> IncreasingQualityDataSourceSupplier<T> create(List<Supplier<DataSource<T>>> dataSourceSuppliers) {
        return new IncreasingQualityDataSourceSupplier<>(dataSourceSuppliers);
    }

    @Override // com.facebook.common.internal.Supplier
    /* renamed from: get */
    public DataSource<T> mo486get() {
        return new IncreasingQualityDataSource();
    }

    public int hashCode() {
        return this.mDataSourceSuppliers.hashCode();
    }

    public boolean equals(Object other) {
        if (other == this) {
            return true;
        }
        if (!(other instanceof IncreasingQualityDataSourceSupplier)) {
            return false;
        }
        IncreasingQualityDataSourceSupplier that = (IncreasingQualityDataSourceSupplier) other;
        return Objects.equal(this.mDataSourceSuppliers, that.mDataSourceSuppliers);
    }

    public String toString() {
        return Objects.toStringHelper(this).add(ArgKeys.LIST, this.mDataSourceSuppliers).toString();
    }

    /* JADX INFO: Access modifiers changed from: private */
    @ThreadSafe
    /* loaded from: classes.dex */
    public class IncreasingQualityDataSource extends AbstractDataSource<T> {
        @GuardedBy("IncreasingQualityDataSource.this")
        @Nullable
        private ArrayList<DataSource<T>> mDataSources;
        @GuardedBy("IncreasingQualityDataSource.this")
        private int mIndexOfDataSourceWithResult;

        public IncreasingQualityDataSource() {
            int n = IncreasingQualityDataSourceSupplier.this.mDataSourceSuppliers.size();
            this.mIndexOfDataSourceWithResult = n;
            this.mDataSources = new ArrayList<>(n);
            for (int i = 0; i < n; i++) {
                DataSource<T> dataSource = (DataSource) ((Supplier) IncreasingQualityDataSourceSupplier.this.mDataSourceSuppliers.get(i)).mo486get();
                this.mDataSources.add(dataSource);
                dataSource.subscribe(new InternalDataSubscriber(i), CallerThreadExecutor.getInstance());
                if (dataSource.hasResult()) {
                    return;
                }
            }
        }

        @Nullable
        private synchronized DataSource<T> getDataSource(int i) {
            return (this.mDataSources == null || i >= this.mDataSources.size()) ? null : this.mDataSources.get(i);
        }

        @Nullable
        private synchronized DataSource<T> getAndClearDataSource(int i) {
            DataSource<T> dataSource = null;
            synchronized (this) {
                if (this.mDataSources != null && i < this.mDataSources.size()) {
                    dataSource = this.mDataSources.set(i, null);
                }
            }
            return dataSource;
        }

        @Nullable
        private synchronized DataSource<T> getDataSourceWithResult() {
            return getDataSource(this.mIndexOfDataSourceWithResult);
        }

        @Override // com.facebook.datasource.AbstractDataSource, com.facebook.datasource.DataSource
        @Nullable
        /* renamed from: getResult */
        public synchronized T mo479getResult() {
            DataSource<T> dataSourceWithResult;
            dataSourceWithResult = getDataSourceWithResult();
            return dataSourceWithResult != null ? dataSourceWithResult.mo479getResult() : null;
        }

        @Override // com.facebook.datasource.AbstractDataSource, com.facebook.datasource.DataSource
        public synchronized boolean hasResult() {
            boolean z;
            DataSource<T> dataSourceWithResult = getDataSourceWithResult();
            if (dataSourceWithResult != null) {
                if (dataSourceWithResult.hasResult()) {
                    z = true;
                }
            }
            z = false;
            return z;
        }

        @Override // com.facebook.datasource.AbstractDataSource, com.facebook.datasource.DataSource
        public boolean close() {
            synchronized (this) {
                if (!super.close()) {
                    return false;
                }
                ArrayList<DataSource<T>> dataSources = this.mDataSources;
                this.mDataSources = null;
                if (dataSources != null) {
                    for (int i = 0; i < dataSources.size(); i++) {
                        closeSafely(dataSources.get(i));
                    }
                }
                return true;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void onDataSourceNewResult(int index, DataSource<T> dataSource) {
            maybeSetIndexOfDataSourceWithResult(index, dataSource, dataSource.isFinished());
            if (dataSource == getDataSourceWithResult()) {
                setResult(null, index == 0 && dataSource.isFinished());
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void onDataSourceFailed(int index, DataSource<T> dataSource) {
            closeSafely(tryGetAndClearDataSource(index, dataSource));
            if (index == 0) {
                setFailure(dataSource.getFailureCause());
            }
        }

        private void maybeSetIndexOfDataSourceWithResult(int index, DataSource<T> dataSource, boolean isFinished) {
            synchronized (this) {
                int oldIndexOfDataSourceWithResult = this.mIndexOfDataSourceWithResult;
                int newIndexOfDataSourceWithResult = this.mIndexOfDataSourceWithResult;
                if (dataSource == getDataSource(index) && index != this.mIndexOfDataSourceWithResult) {
                    if (getDataSourceWithResult() == null || (isFinished && index < this.mIndexOfDataSourceWithResult)) {
                        newIndexOfDataSourceWithResult = index;
                        this.mIndexOfDataSourceWithResult = index;
                    }
                    for (int i = oldIndexOfDataSourceWithResult; i > newIndexOfDataSourceWithResult; i--) {
                        closeSafely(getAndClearDataSource(i));
                    }
                }
            }
        }

        @Nullable
        private synchronized DataSource<T> tryGetAndClearDataSource(int i, DataSource<T> dataSource) {
            if (dataSource == getDataSourceWithResult()) {
                dataSource = null;
            } else if (dataSource == getDataSource(i)) {
                dataSource = getAndClearDataSource(i);
            }
            return dataSource;
        }

        private void closeSafely(DataSource<T> dataSource) {
            if (dataSource != null) {
                dataSource.close();
            }
        }

        /* loaded from: classes.dex */
        private class InternalDataSubscriber implements DataSubscriber<T> {
            private int mIndex;

            public InternalDataSubscriber(int index) {
                this.mIndex = index;
            }

            @Override // com.facebook.datasource.DataSubscriber
            public void onNewResult(DataSource<T> dataSource) {
                if (dataSource.hasResult()) {
                    IncreasingQualityDataSource.this.onDataSourceNewResult(this.mIndex, dataSource);
                } else if (dataSource.isFinished()) {
                    IncreasingQualityDataSource.this.onDataSourceFailed(this.mIndex, dataSource);
                }
            }

            @Override // com.facebook.datasource.DataSubscriber
            public void onFailure(DataSource<T> dataSource) {
                IncreasingQualityDataSource.this.onDataSourceFailed(this.mIndex, dataSource);
            }

            @Override // com.facebook.datasource.DataSubscriber
            public void onCancellation(DataSource<T> dataSource) {
            }

            @Override // com.facebook.datasource.DataSubscriber
            public void onProgressUpdate(DataSource<T> dataSource) {
                if (this.mIndex == 0) {
                    IncreasingQualityDataSource.this.setProgress(dataSource.getProgress());
                }
            }
        }
    }
}
