package com.facebook.imagepipeline.datasource;

import com.facebook.common.references.CloseableReference;
import com.facebook.datasource.DataSource;
import com.facebook.imagepipeline.listener.RequestListener;
import com.facebook.imagepipeline.producers.Producer;
import com.facebook.imagepipeline.producers.SettableProducerContext;
import javax.annotation.Nullable;
import javax.annotation.concurrent.ThreadSafe;
@ThreadSafe
/* loaded from: classes.dex */
public class CloseableProducerToDataSourceAdapter<T> extends AbstractProducerToDataSourceAdapter<CloseableReference<T>> {
    @Override // com.facebook.datasource.AbstractDataSource
    protected /* bridge */ /* synthetic */ void closeResult(Object obj) {
        closeResult((CloseableReference) ((CloseableReference) obj));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.imagepipeline.datasource.AbstractProducerToDataSourceAdapter
    public /* bridge */ /* synthetic */ void onNewResultImpl(Object obj, boolean z) {
        onNewResultImpl((CloseableReference) ((CloseableReference) obj), z);
    }

    public static <T> DataSource<CloseableReference<T>> create(Producer<CloseableReference<T>> producer, SettableProducerContext settableProducerContext, RequestListener listener) {
        return new CloseableProducerToDataSourceAdapter(producer, settableProducerContext, listener);
    }

    private CloseableProducerToDataSourceAdapter(Producer<CloseableReference<T>> producer, SettableProducerContext settableProducerContext, RequestListener listener) {
        super(producer, settableProducerContext, listener);
    }

    @Override // com.facebook.datasource.AbstractDataSource, com.facebook.datasource.DataSource
    @Nullable
    /* renamed from: getResult */
    public CloseableReference<T> mo479getResult() {
        return CloseableReference.cloneOrNull((CloseableReference) super.mo479getResult());
    }

    protected void closeResult(CloseableReference<T> result) {
        CloseableReference.closeSafely((CloseableReference<?>) result);
    }

    protected void onNewResultImpl(CloseableReference<T> result, boolean isLast) {
        super.onNewResultImpl((CloseableProducerToDataSourceAdapter<T>) CloseableReference.cloneOrNull(result), isLast);
    }
}
