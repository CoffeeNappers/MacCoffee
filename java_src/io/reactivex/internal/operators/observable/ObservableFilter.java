package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.annotations.Nullable;
import io.reactivex.functions.Predicate;
import io.reactivex.internal.observers.BasicFuseableObserver;
/* loaded from: classes3.dex */
public final class ObservableFilter<T> extends AbstractObservableWithUpstream<T, T> {
    final Predicate<? super T> predicate;

    public ObservableFilter(ObservableSource<T> source, Predicate<? super T> predicate) {
        super(source);
        this.predicate = predicate;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> s) {
        this.source.subscribe(new FilterObserver(s, this.predicate));
    }

    /* loaded from: classes3.dex */
    static final class FilterObserver<T> extends BasicFuseableObserver<T, T> {
        final Predicate<? super T> filter;

        FilterObserver(Observer<? super T> actual, Predicate<? super T> filter) {
            super(actual);
            this.filter = filter;
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (this.sourceMode == 0) {
                try {
                    boolean b = this.filter.test(t);
                    if (b) {
                        this.actual.onNext(t);
                        return;
                    }
                    return;
                } catch (Throwable e) {
                    fail(e);
                    return;
                }
            }
            this.actual.onNext(null);
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public int requestFusion(int mode) {
            return transitiveBoundaryFusion(mode);
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public T mo1188poll() throws Exception {
            T v;
            do {
                v = this.qs.mo1188poll();
                if (v == null) {
                    break;
                }
            } while (!this.filter.test(v));
            return v;
        }
    }
}
