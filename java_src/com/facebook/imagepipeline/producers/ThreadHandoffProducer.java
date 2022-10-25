package com.facebook.imagepipeline.producers;

import com.facebook.common.internal.Preconditions;
/* loaded from: classes.dex */
public class ThreadHandoffProducer<T> implements Producer<T> {
    public static final String PRODUCER_NAME = "BackgroundThreadHandoffProducer";
    private final Producer<T> mInputProducer;
    private final ThreadHandoffProducerQueue mThreadHandoffProducerQueue;

    public ThreadHandoffProducer(Producer<T> inputProducer, ThreadHandoffProducerQueue inputThreadHandoffProducerQueue) {
        this.mInputProducer = (Producer) Preconditions.checkNotNull(inputProducer);
        this.mThreadHandoffProducerQueue = inputThreadHandoffProducerQueue;
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(final Consumer<T> consumer, final ProducerContext context) {
        final ProducerListener producerListener = context.getListener();
        final String requestId = context.getId();
        final StatefulProducerRunnable<T> statefulRunnable = new StatefulProducerRunnable<T>(consumer, producerListener, PRODUCER_NAME, requestId) { // from class: com.facebook.imagepipeline.producers.ThreadHandoffProducer.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.facebook.imagepipeline.producers.StatefulProducerRunnable, com.facebook.common.executors.StatefulRunnable
            public void onSuccess(T ignored) {
                producerListener.onProducerFinishWithSuccess(requestId, ThreadHandoffProducer.PRODUCER_NAME, null);
                ThreadHandoffProducer.this.mInputProducer.produceResults(consumer, context);
            }

            @Override // com.facebook.imagepipeline.producers.StatefulProducerRunnable, com.facebook.common.executors.StatefulRunnable
            protected void disposeResult(T ignored) {
            }

            @Override // com.facebook.common.executors.StatefulRunnable
            /* renamed from: getResult */
            protected T mo244getResult() throws Exception {
                return null;
            }
        };
        context.addCallbacks(new BaseProducerContextCallbacks() { // from class: com.facebook.imagepipeline.producers.ThreadHandoffProducer.2
            @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
            public void onCancellationRequested() {
                statefulRunnable.cancel();
                ThreadHandoffProducer.this.mThreadHandoffProducerQueue.remove(statefulRunnable);
            }
        });
        this.mThreadHandoffProducerQueue.addToQueueOrExecute(statefulRunnable);
    }
}
