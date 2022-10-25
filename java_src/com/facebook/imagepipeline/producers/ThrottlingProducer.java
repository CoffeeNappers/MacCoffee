package com.facebook.imagepipeline.producers;

import android.util.Pair;
import com.facebook.common.internal.Preconditions;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import javax.annotation.concurrent.GuardedBy;
/* loaded from: classes.dex */
public class ThrottlingProducer<T> implements Producer<T> {
    public static final String PRODUCER_NAME = "ThrottlingProducer";
    private final Executor mExecutor;
    private final Producer<T> mInputProducer;
    private final int mMaxSimultaneousRequests;
    @GuardedBy("this")
    private final ConcurrentLinkedQueue<Pair<Consumer<T>, ProducerContext>> mPendingRequests = new ConcurrentLinkedQueue<>();
    @GuardedBy("this")
    private int mNumCurrentRequests = 0;

    static /* synthetic */ int access$210(ThrottlingProducer x0) {
        int i = x0.mNumCurrentRequests;
        x0.mNumCurrentRequests = i - 1;
        return i;
    }

    public ThrottlingProducer(int maxSimultaneousRequests, Executor executor, Producer<T> inputProducer) {
        this.mMaxSimultaneousRequests = maxSimultaneousRequests;
        this.mExecutor = (Executor) Preconditions.checkNotNull(executor);
        this.mInputProducer = (Producer) Preconditions.checkNotNull(inputProducer);
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<T> consumer, ProducerContext producerContext) {
        boolean delayRequest;
        ProducerListener producerListener = producerContext.getListener();
        producerListener.onProducerStart(producerContext.getId(), PRODUCER_NAME);
        synchronized (this) {
            if (this.mNumCurrentRequests >= this.mMaxSimultaneousRequests) {
                this.mPendingRequests.add(Pair.create(consumer, producerContext));
                delayRequest = true;
            } else {
                this.mNumCurrentRequests++;
                delayRequest = false;
            }
        }
        if (!delayRequest) {
            produceResultsInternal(consumer, producerContext);
        }
    }

    void produceResultsInternal(Consumer<T> consumer, ProducerContext producerContext) {
        ProducerListener producerListener = producerContext.getListener();
        producerListener.onProducerFinishWithSuccess(producerContext.getId(), PRODUCER_NAME, null);
        this.mInputProducer.produceResults(new ThrottlerConsumer(consumer), producerContext);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class ThrottlerConsumer extends DelegatingConsumer<T, T> {
        private ThrottlerConsumer(Consumer<T> consumer) {
            super(consumer);
        }

        @Override // com.facebook.imagepipeline.producers.BaseConsumer
        protected void onNewResultImpl(T newResult, boolean isLast) {
            getConsumer().onNewResult(newResult, isLast);
            if (isLast) {
                onRequestFinished();
            }
        }

        @Override // com.facebook.imagepipeline.producers.DelegatingConsumer, com.facebook.imagepipeline.producers.BaseConsumer
        protected void onFailureImpl(Throwable t) {
            getConsumer().onFailure(t);
            onRequestFinished();
        }

        @Override // com.facebook.imagepipeline.producers.DelegatingConsumer, com.facebook.imagepipeline.producers.BaseConsumer
        protected void onCancellationImpl() {
            getConsumer().onCancellation();
            onRequestFinished();
        }

        private void onRequestFinished() {
            final Pair<Consumer<T>, ProducerContext> nextRequestPair;
            synchronized (ThrottlingProducer.this) {
                nextRequestPair = (Pair) ThrottlingProducer.this.mPendingRequests.poll();
                if (nextRequestPair == null) {
                    ThrottlingProducer.access$210(ThrottlingProducer.this);
                }
            }
            if (nextRequestPair != null) {
                ThrottlingProducer.this.mExecutor.execute(new Runnable() { // from class: com.facebook.imagepipeline.producers.ThrottlingProducer.ThrottlerConsumer.1
                    @Override // java.lang.Runnable
                    public void run() {
                        ThrottlingProducer.this.produceResultsInternal((Consumer) nextRequestPair.first, (ProducerContext) nextRequestPair.second);
                    }
                });
            }
        }
    }
}
