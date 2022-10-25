package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.annotations.Nullable;
import io.reactivex.internal.fuseable.ConditionalSubscriber;
import io.reactivex.internal.subscriptions.BasicQueueSubscription;
import io.reactivex.internal.subscriptions.SubscriptionHelper;
import io.reactivex.internal.util.BackpressureHelper;
import org.reactivestreams.Subscriber;
/* loaded from: classes3.dex */
public final class FlowableRange extends Flowable<Integer> {
    final int end;
    final int start;

    public FlowableRange(int start, int count) {
        this.start = start;
        this.end = start + count;
    }

    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super Integer> s) {
        if (s instanceof ConditionalSubscriber) {
            s.onSubscribe(new RangeConditionalSubscription((ConditionalSubscriber) s, this.start, this.end));
        } else {
            s.onSubscribe(new RangeSubscription(s, this.start, this.end));
        }
    }

    /* loaded from: classes3.dex */
    static abstract class BaseRangeSubscription extends BasicQueueSubscription<Integer> {
        private static final long serialVersionUID = -2252972430506210021L;
        volatile boolean cancelled;
        final int end;
        int index;

        abstract void fastPath();

        abstract void slowPath(long j);

        BaseRangeSubscription(int index, int end) {
            this.index = index;
            this.end = end;
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public final int requestFusion(int mode) {
            return mode & 1;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public final Integer mo1188poll() {
            int i = this.index;
            if (i == this.end) {
                return null;
            }
            this.index = i + 1;
            return Integer.valueOf(i);
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public final boolean isEmpty() {
            return this.index == this.end;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public final void clear() {
            this.index = this.end;
        }

        @Override // org.reactivestreams.Subscription
        public final void request(long n) {
            if (SubscriptionHelper.validate(n) && BackpressureHelper.add(this, n) == 0) {
                if (n == Long.MAX_VALUE) {
                    fastPath();
                } else {
                    slowPath(n);
                }
            }
        }

        @Override // org.reactivestreams.Subscription
        public final void cancel() {
            this.cancelled = true;
        }
    }

    /* loaded from: classes3.dex */
    static final class RangeSubscription extends BaseRangeSubscription {
        private static final long serialVersionUID = 2587302975077663557L;
        final Subscriber<? super Integer> actual;

        RangeSubscription(Subscriber<? super Integer> actual, int index, int end) {
            super(index, end);
            this.actual = actual;
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableRange.BaseRangeSubscription
        void fastPath() {
            int f = this.end;
            Subscriber<? super Integer> a = this.actual;
            for (int i = this.index; i != f; i++) {
                if (!this.cancelled) {
                    a.onNext(Integer.valueOf(i));
                } else {
                    return;
                }
            }
            if (!this.cancelled) {
                a.onComplete();
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableRange.BaseRangeSubscription
        void slowPath(long r) {
            long e = 0;
            int f = this.end;
            int i = this.index;
            Subscriber<? super Integer> a = this.actual;
            while (true) {
                if (e != r && i != f) {
                    if (!this.cancelled) {
                        a.onNext(Integer.valueOf(i));
                        e++;
                        i++;
                    } else {
                        return;
                    }
                } else if (i == f) {
                    if (!this.cancelled) {
                        a.onComplete();
                        return;
                    }
                    return;
                } else {
                    r = get();
                    if (e == r) {
                        this.index = i;
                        r = addAndGet(-e);
                        if (r == 0) {
                            return;
                        }
                        e = 0;
                    } else {
                        continue;
                    }
                }
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class RangeConditionalSubscription extends BaseRangeSubscription {
        private static final long serialVersionUID = 2587302975077663557L;
        final ConditionalSubscriber<? super Integer> actual;

        RangeConditionalSubscription(ConditionalSubscriber<? super Integer> actual, int index, int end) {
            super(index, end);
            this.actual = actual;
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableRange.BaseRangeSubscription
        void fastPath() {
            int f = this.end;
            ConditionalSubscriber<? super Integer> a = this.actual;
            for (int i = this.index; i != f; i++) {
                if (!this.cancelled) {
                    a.tryOnNext(Integer.valueOf(i));
                } else {
                    return;
                }
            }
            if (!this.cancelled) {
                a.onComplete();
            }
        }

        @Override // io.reactivex.internal.operators.flowable.FlowableRange.BaseRangeSubscription
        void slowPath(long r) {
            long e = 0;
            int f = this.end;
            int i = this.index;
            ConditionalSubscriber<? super Integer> a = this.actual;
            while (true) {
                if (e != r && i != f) {
                    if (!this.cancelled) {
                        if (a.tryOnNext(Integer.valueOf(i))) {
                            e++;
                        }
                        i++;
                    } else {
                        return;
                    }
                } else if (i == f) {
                    if (!this.cancelled) {
                        a.onComplete();
                        return;
                    }
                    return;
                } else {
                    r = get();
                    if (e == r) {
                        this.index = i;
                        r = addAndGet(-e);
                        if (r == 0) {
                            return;
                        }
                        e = 0;
                    } else {
                        continue;
                    }
                }
            }
        }
    }
}
