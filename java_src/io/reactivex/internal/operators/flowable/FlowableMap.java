package io.reactivex.internal.operators.flowable;

import io.reactivex.Flowable;
import io.reactivex.FlowableSubscriber;
import io.reactivex.annotations.Nullable;
import io.reactivex.functions.Function;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.fuseable.ConditionalSubscriber;
import io.reactivex.internal.subscribers.BasicFuseableConditionalSubscriber;
import io.reactivex.internal.subscribers.BasicFuseableSubscriber;
import org.reactivestreams.Subscriber;
/* loaded from: classes3.dex */
public final class FlowableMap<T, U> extends AbstractFlowableWithUpstream<T, U> {
    final Function<? super T, ? extends U> mapper;

    public FlowableMap(Flowable<T> source, Function<? super T, ? extends U> mapper) {
        super(source);
        this.mapper = mapper;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // io.reactivex.Flowable
    public void subscribeActual(Subscriber<? super U> s) {
        if (s instanceof ConditionalSubscriber) {
            this.source.subscribe((FlowableSubscriber) new MapConditionalSubscriber((ConditionalSubscriber) s, this.mapper));
        } else {
            this.source.subscribe((FlowableSubscriber) new MapSubscriber(s, this.mapper));
        }
    }

    /* loaded from: classes3.dex */
    static final class MapSubscriber<T, U> extends BasicFuseableSubscriber<T, U> {
        final Function<? super T, ? extends U> mapper;

        /* JADX INFO: Access modifiers changed from: package-private */
        public MapSubscriber(Subscriber<? super U> actual, Function<? super T, ? extends U> mapper) {
            super(actual);
            this.mapper = mapper;
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                if (this.sourceMode != 0) {
                    this.actual.onNext(null);
                    return;
                }
                try {
                    this.actual.onNext(ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The mapper function returned a null value."));
                } catch (Throwable ex) {
                    fail(ex);
                }
            }
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public int requestFusion(int mode) {
            return transitiveBoundaryFusion(mode);
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public U mo1188poll() throws Exception {
            T t = this.qs.mo1188poll();
            if (t != null) {
                return (U) ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The mapper function returned a null value.");
            }
            return null;
        }
    }

    /* loaded from: classes3.dex */
    static final class MapConditionalSubscriber<T, U> extends BasicFuseableConditionalSubscriber<T, U> {
        final Function<? super T, ? extends U> mapper;

        MapConditionalSubscriber(ConditionalSubscriber<? super U> actual, Function<? super T, ? extends U> function) {
            super(actual);
            this.mapper = function;
        }

        @Override // org.reactivestreams.Subscriber
        public void onNext(T t) {
            if (!this.done) {
                if (this.sourceMode != 0) {
                    this.actual.onNext(null);
                    return;
                }
                try {
                    this.actual.onNext(ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The mapper function returned a null value."));
                } catch (Throwable ex) {
                    fail(ex);
                }
            }
        }

        @Override // io.reactivex.internal.fuseable.ConditionalSubscriber
        public boolean tryOnNext(T t) {
            if (this.done) {
                return false;
            }
            try {
                return this.actual.tryOnNext(ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The mapper function returned a null value."));
            } catch (Throwable ex) {
                fail(ex);
                return true;
            }
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public int requestFusion(int mode) {
            return transitiveBoundaryFusion(mode);
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public U mo1188poll() throws Exception {
            T t = this.qs.mo1188poll();
            if (t != null) {
                return (U) ObjectHelper.requireNonNull(this.mapper.mo1190apply(t), "The mapper function returned a null value.");
            }
            return null;
        }
    }
}
