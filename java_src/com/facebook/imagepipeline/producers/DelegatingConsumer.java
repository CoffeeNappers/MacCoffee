package com.facebook.imagepipeline.producers;
/* loaded from: classes.dex */
public abstract class DelegatingConsumer<I, O> extends BaseConsumer<I> {
    private final Consumer<O> mConsumer;

    public DelegatingConsumer(Consumer<O> consumer) {
        this.mConsumer = consumer;
    }

    public Consumer<O> getConsumer() {
        return this.mConsumer;
    }

    @Override // com.facebook.imagepipeline.producers.BaseConsumer
    protected void onFailureImpl(Throwable t) {
        this.mConsumer.onFailure(t);
    }

    @Override // com.facebook.imagepipeline.producers.BaseConsumer
    protected void onCancellationImpl() {
        this.mConsumer.onCancellation();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.facebook.imagepipeline.producers.BaseConsumer
    public void onProgressUpdateImpl(float progress) {
        this.mConsumer.onProgressUpdate(progress);
    }
}
