package com.facebook.imagepipeline.producers;

import com.facebook.common.executors.StatefulRunnable;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class StatefulProducerRunnable<T> extends StatefulRunnable<T> {
    private final Consumer<T> mConsumer;
    private final ProducerListener mProducerListener;
    private final String mProducerName;
    private final String mRequestId;

    @Override // com.facebook.common.executors.StatefulRunnable
    protected abstract void disposeResult(T t);

    public StatefulProducerRunnable(Consumer<T> consumer, ProducerListener producerListener, String producerName, String requestId) {
        this.mConsumer = consumer;
        this.mProducerListener = producerListener;
        this.mProducerName = producerName;
        this.mRequestId = requestId;
        this.mProducerListener.onProducerStart(this.mRequestId, this.mProducerName);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.common.executors.StatefulRunnable
    public void onSuccess(T result) {
        this.mProducerListener.onProducerFinishWithSuccess(this.mRequestId, this.mProducerName, this.mProducerListener.requiresExtraMap(this.mRequestId) ? getExtraMapOnSuccess(result) : null);
        this.mConsumer.onNewResult(result, true);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.common.executors.StatefulRunnable
    public void onFailure(Exception e) {
        this.mProducerListener.onProducerFinishWithFailure(this.mRequestId, this.mProducerName, e, this.mProducerListener.requiresExtraMap(this.mRequestId) ? getExtraMapOnFailure(e) : null);
        this.mConsumer.onFailure(e);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.common.executors.StatefulRunnable
    public void onCancellation() {
        this.mProducerListener.onProducerFinishWithCancellation(this.mRequestId, this.mProducerName, this.mProducerListener.requiresExtraMap(this.mRequestId) ? getExtraMapOnCancellation() : null);
        this.mConsumer.onCancellation();
    }

    protected Map<String, String> getExtraMapOnSuccess(T result) {
        return null;
    }

    protected Map<String, String> getExtraMapOnFailure(Exception exception) {
        return null;
    }

    protected Map<String, String> getExtraMapOnCancellation() {
        return null;
    }
}
