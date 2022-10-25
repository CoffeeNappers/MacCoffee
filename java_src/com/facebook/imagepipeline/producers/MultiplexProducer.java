package com.facebook.imagepipeline.producers;

import android.util.Pair;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Sets;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.imagepipeline.common.Priority;
import java.io.Closeable;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.ThreadSafe;
@ThreadSafe
/* loaded from: classes.dex */
public abstract class MultiplexProducer<K, T extends Closeable> implements Producer<T> {
    private final Producer<T> mInputProducer;
    @VisibleForTesting
    @GuardedBy("this")
    final Map<K, MultiplexProducer<K, T>.Multiplexer> mMultiplexers = new HashMap();

    protected abstract T cloneOrNull(T t);

    /* renamed from: getKey */
    protected abstract K mo239getKey(ProducerContext producerContext);

    /* JADX INFO: Access modifiers changed from: protected */
    public MultiplexProducer(Producer<T> inputProducer) {
        this.mInputProducer = inputProducer;
    }

    @Override // com.facebook.imagepipeline.producers.Producer
    public void produceResults(Consumer<T> consumer, ProducerContext context) {
        boolean createdNewMultiplexer;
        MultiplexProducer<K, T>.Multiplexer multiplexer;
        K key = mo239getKey(context);
        do {
            createdNewMultiplexer = false;
            synchronized (this) {
                multiplexer = getExistingMultiplexer(key);
                if (multiplexer == null) {
                    multiplexer = createAndPutNewMultiplexer(key);
                    createdNewMultiplexer = true;
                }
            }
        } while (!multiplexer.addNewConsumer(consumer, context));
        if (!createdNewMultiplexer) {
            return;
        }
        multiplexer.startInputProducerIfHasAttachedConsumers();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized MultiplexProducer<K, T>.Multiplexer getExistingMultiplexer(K key) {
        return this.mMultiplexers.get(key);
    }

    private synchronized MultiplexProducer<K, T>.Multiplexer createAndPutNewMultiplexer(K key) {
        MultiplexProducer<K, T>.Multiplexer multiplexer;
        multiplexer = new Multiplexer(key);
        this.mMultiplexers.put(key, multiplexer);
        return multiplexer;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void removeMultiplexer(K key, MultiplexProducer<K, T>.Multiplexer multiplexer) {
        if (this.mMultiplexers.get(key) == multiplexer) {
            this.mMultiplexers.remove(key);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @VisibleForTesting
    /* loaded from: classes.dex */
    public class Multiplexer {
        private final CopyOnWriteArraySet<Pair<Consumer<T>, ProducerContext>> mConsumerContextPairs = Sets.newCopyOnWriteArraySet();
        @GuardedBy("Multiplexer.this")
        @Nullable
        private MultiplexProducer<K, T>.Multiplexer.ForwardingConsumer mForwardingConsumer;
        private final K mKey;
        @GuardedBy("Multiplexer.this")
        @Nullable
        private T mLastIntermediateResult;
        @GuardedBy("Multiplexer.this")
        private float mLastProgress;
        @GuardedBy("Multiplexer.this")
        @Nullable
        private BaseProducerContext mMultiplexProducerContext;

        public Multiplexer(K key) {
            this.mKey = key;
        }

        /* JADX WARN: Multi-variable type inference failed */
        public boolean addNewConsumer(Consumer<T> consumer, ProducerContext producerContext) {
            Pair<Consumer<T>, ProducerContext> consumerContextPair = Pair.create(consumer, producerContext);
            synchronized (this) {
                if (MultiplexProducer.this.getExistingMultiplexer(this.mKey) != this) {
                    return false;
                }
                this.mConsumerContextPairs.add(consumerContextPair);
                List<ProducerContextCallbacks> prefetchCallbacks = updateIsPrefetch();
                List<ProducerContextCallbacks> priorityCallbacks = updatePriority();
                List<ProducerContextCallbacks> intermediateResultsCallbacks = updateIsIntermediateResultExpected();
                Closeable closeable = this.mLastIntermediateResult;
                float lastProgress = this.mLastProgress;
                BaseProducerContext.callOnIsPrefetchChanged(prefetchCallbacks);
                BaseProducerContext.callOnPriorityChanged(priorityCallbacks);
                BaseProducerContext.callOnIsIntermediateResultExpectedChanged(intermediateResultsCallbacks);
                synchronized (consumerContextPair) {
                    synchronized (this) {
                        if (closeable != this.mLastIntermediateResult) {
                            closeable = null;
                        } else if (closeable != null) {
                            closeable = MultiplexProducer.this.cloneOrNull(closeable);
                        }
                    }
                    if (closeable != null) {
                        if (lastProgress > 0.0f) {
                            consumer.onProgressUpdate(lastProgress);
                        }
                        consumer.onNewResult(closeable, false);
                        closeSafely(closeable);
                    }
                }
                addCallbacks(consumerContextPair, producerContext);
                return true;
            }
        }

        private void addCallbacks(final Pair<Consumer<T>, ProducerContext> consumerContextPair, ProducerContext producerContext) {
            producerContext.addCallbacks(new BaseProducerContextCallbacks() { // from class: com.facebook.imagepipeline.producers.MultiplexProducer.Multiplexer.1
                @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
                public void onCancellationRequested() {
                    boolean pairWasRemoved;
                    BaseProducerContext contextToCancel = null;
                    List<ProducerContextCallbacks> isPrefetchCallbacks = null;
                    List<ProducerContextCallbacks> priorityCallbacks = null;
                    List<ProducerContextCallbacks> isIntermediateResultExpectedCallbacks = null;
                    synchronized (Multiplexer.this) {
                        pairWasRemoved = Multiplexer.this.mConsumerContextPairs.remove(consumerContextPair);
                        if (pairWasRemoved) {
                            if (Multiplexer.this.mConsumerContextPairs.isEmpty()) {
                                contextToCancel = Multiplexer.this.mMultiplexProducerContext;
                            } else {
                                isPrefetchCallbacks = Multiplexer.this.updateIsPrefetch();
                                priorityCallbacks = Multiplexer.this.updatePriority();
                                isIntermediateResultExpectedCallbacks = Multiplexer.this.updateIsIntermediateResultExpected();
                            }
                        }
                    }
                    BaseProducerContext.callOnIsPrefetchChanged(isPrefetchCallbacks);
                    BaseProducerContext.callOnPriorityChanged(priorityCallbacks);
                    BaseProducerContext.callOnIsIntermediateResultExpectedChanged(isIntermediateResultExpectedCallbacks);
                    if (contextToCancel != null) {
                        contextToCancel.cancel();
                    }
                    if (pairWasRemoved) {
                        ((Consumer) consumerContextPair.first).onCancellation();
                    }
                }

                @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
                public void onIsPrefetchChanged() {
                    BaseProducerContext.callOnIsPrefetchChanged(Multiplexer.this.updateIsPrefetch());
                }

                @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
                public void onIsIntermediateResultExpectedChanged() {
                    BaseProducerContext.callOnIsIntermediateResultExpectedChanged(Multiplexer.this.updateIsIntermediateResultExpected());
                }

                @Override // com.facebook.imagepipeline.producers.BaseProducerContextCallbacks, com.facebook.imagepipeline.producers.ProducerContextCallbacks
                public void onPriorityChanged() {
                    BaseProducerContext.callOnPriorityChanged(Multiplexer.this.updatePriority());
                }
            });
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void startInputProducerIfHasAttachedConsumers() {
            boolean z = true;
            synchronized (this) {
                Preconditions.checkArgument(this.mMultiplexProducerContext == null);
                if (this.mForwardingConsumer != null) {
                    z = false;
                }
                Preconditions.checkArgument(z);
                if (this.mConsumerContextPairs.isEmpty()) {
                    MultiplexProducer.this.removeMultiplexer(this.mKey, this);
                    return;
                }
                ProducerContext producerContext = (ProducerContext) this.mConsumerContextPairs.iterator().next().second;
                this.mMultiplexProducerContext = new BaseProducerContext(producerContext.getImageRequest(), producerContext.getId(), producerContext.getListener(), producerContext.getCallerContext(), producerContext.getLowestPermittedRequestLevel(), computeIsPrefetch(), computeIsIntermediateResultExpected(), computePriority());
                this.mForwardingConsumer = new ForwardingConsumer();
                BaseProducerContext multiplexProducerContext = this.mMultiplexProducerContext;
                MultiplexProducer<K, T>.Multiplexer.ForwardingConsumer forwardingConsumer = this.mForwardingConsumer;
                MultiplexProducer.this.mInputProducer.produceResults(forwardingConsumer, multiplexProducerContext);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        @Nullable
        public synchronized List<ProducerContextCallbacks> updateIsPrefetch() {
            return this.mMultiplexProducerContext == null ? null : this.mMultiplexProducerContext.setIsPrefetchNoCallbacks(computeIsPrefetch());
        }

        private synchronized boolean computeIsPrefetch() {
            boolean z;
            Iterator<Pair<Consumer<T>, ProducerContext>> it = this.mConsumerContextPairs.iterator();
            while (true) {
                if (!it.hasNext()) {
                    z = true;
                    break;
                }
                Pair<Consumer<T>, ProducerContext> pair = it.next();
                if (!((ProducerContext) pair.second).isPrefetch()) {
                    z = false;
                    break;
                }
            }
            return z;
        }

        /* JADX INFO: Access modifiers changed from: private */
        @Nullable
        public synchronized List<ProducerContextCallbacks> updateIsIntermediateResultExpected() {
            List<ProducerContextCallbacks> isIntermediateResultExpectedNoCallbacks;
            if (this.mMultiplexProducerContext == null) {
                isIntermediateResultExpectedNoCallbacks = null;
            } else {
                isIntermediateResultExpectedNoCallbacks = this.mMultiplexProducerContext.setIsIntermediateResultExpectedNoCallbacks(computeIsIntermediateResultExpected());
            }
            return isIntermediateResultExpectedNoCallbacks;
        }

        private synchronized boolean computeIsIntermediateResultExpected() {
            boolean z;
            Iterator<Pair<Consumer<T>, ProducerContext>> it = this.mConsumerContextPairs.iterator();
            while (true) {
                if (!it.hasNext()) {
                    z = false;
                    break;
                }
                Pair<Consumer<T>, ProducerContext> pair = it.next();
                if (((ProducerContext) pair.second).isIntermediateResultExpected()) {
                    z = true;
                    break;
                }
            }
            return z;
        }

        /* JADX INFO: Access modifiers changed from: private */
        @Nullable
        public synchronized List<ProducerContextCallbacks> updatePriority() {
            return this.mMultiplexProducerContext == null ? null : this.mMultiplexProducerContext.setPriorityNoCallbacks(computePriority());
        }

        private synchronized Priority computePriority() {
            Priority priority;
            priority = Priority.LOW;
            Iterator<Pair<Consumer<T>, ProducerContext>> it = this.mConsumerContextPairs.iterator();
            while (it.hasNext()) {
                Pair<Consumer<T>, ProducerContext> pair = it.next();
                priority = Priority.getHigherPriority(priority, ((ProducerContext) pair.second).getPriority());
            }
            return priority;
        }

        public void onFailure(MultiplexProducer<K, T>.Multiplexer.ForwardingConsumer consumer, Throwable t) {
            synchronized (this) {
                if (this.mForwardingConsumer == consumer) {
                    Iterator<Pair<Consumer<T>, ProducerContext>> iterator = this.mConsumerContextPairs.iterator();
                    this.mConsumerContextPairs.clear();
                    MultiplexProducer.this.removeMultiplexer(this.mKey, this);
                    closeSafely(this.mLastIntermediateResult);
                    this.mLastIntermediateResult = null;
                    while (iterator.hasNext()) {
                        Pair<Consumer<T>, ProducerContext> pair = iterator.next();
                        synchronized (pair) {
                            ((Consumer) pair.first).onFailure(t);
                        }
                    }
                }
            }
        }

        public void onNextResult(MultiplexProducer<K, T>.Multiplexer.ForwardingConsumer consumer, T closeableObject, boolean isFinal) {
            synchronized (this) {
                if (this.mForwardingConsumer == consumer) {
                    closeSafely(this.mLastIntermediateResult);
                    this.mLastIntermediateResult = null;
                    Iterator<Pair<Consumer<T>, ProducerContext>> iterator = this.mConsumerContextPairs.iterator();
                    if (!isFinal) {
                        this.mLastIntermediateResult = (T) MultiplexProducer.this.cloneOrNull(closeableObject);
                    } else {
                        this.mConsumerContextPairs.clear();
                        MultiplexProducer.this.removeMultiplexer(this.mKey, this);
                    }
                    while (iterator.hasNext()) {
                        Pair<Consumer<T>, ProducerContext> pair = iterator.next();
                        synchronized (pair) {
                            ((Consumer) pair.first).onNewResult(closeableObject, isFinal);
                        }
                    }
                }
            }
        }

        public void onCancelled(MultiplexProducer<K, T>.Multiplexer.ForwardingConsumer forwardingConsumer) {
            synchronized (this) {
                if (this.mForwardingConsumer == forwardingConsumer) {
                    this.mForwardingConsumer = null;
                    this.mMultiplexProducerContext = null;
                    closeSafely(this.mLastIntermediateResult);
                    this.mLastIntermediateResult = null;
                    startInputProducerIfHasAttachedConsumers();
                }
            }
        }

        public void onProgressUpdate(MultiplexProducer<K, T>.Multiplexer.ForwardingConsumer forwardingConsumer, float progress) {
            synchronized (this) {
                if (this.mForwardingConsumer == forwardingConsumer) {
                    this.mLastProgress = progress;
                    Iterator<Pair<Consumer<T>, ProducerContext>> iterator = this.mConsumerContextPairs.iterator();
                    while (iterator.hasNext()) {
                        Pair<Consumer<T>, ProducerContext> pair = iterator.next();
                        synchronized (pair) {
                            ((Consumer) pair.first).onProgressUpdate(progress);
                        }
                    }
                }
            }
        }

        private void closeSafely(Closeable obj) {
            if (obj != null) {
                try {
                    obj.close();
                } catch (IOException ioe) {
                    throw new RuntimeException(ioe);
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        /* loaded from: classes.dex */
        public class ForwardingConsumer extends BaseConsumer<T> {
            private ForwardingConsumer() {
            }

            /* JADX WARN: Multi-variable type inference failed */
            @Override // com.facebook.imagepipeline.producers.BaseConsumer
            protected /* bridge */ /* synthetic */ void onNewResultImpl(Object obj, boolean z) {
                onNewResultImpl((ForwardingConsumer) ((Closeable) obj), z);
            }

            protected void onNewResultImpl(T newResult, boolean isLast) {
                Multiplexer.this.onNextResult(this, newResult, isLast);
            }

            @Override // com.facebook.imagepipeline.producers.BaseConsumer
            protected void onFailureImpl(Throwable t) {
                Multiplexer.this.onFailure(this, t);
            }

            @Override // com.facebook.imagepipeline.producers.BaseConsumer
            protected void onCancellationImpl() {
                Multiplexer.this.onCancelled(this);
            }

            @Override // com.facebook.imagepipeline.producers.BaseConsumer
            protected void onProgressUpdateImpl(float progress) {
                Multiplexer.this.onProgressUpdate(this, progress);
            }
        }
    }
}
