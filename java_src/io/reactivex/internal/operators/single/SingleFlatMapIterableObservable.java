package io.reactivex.internal.operators.single;

import io.reactivex.Observable;
import io.reactivex.Observer;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.annotations.Nullable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.BasicIntQueueDisposable;
import java.util.Iterator;
/* loaded from: classes3.dex */
public final class SingleFlatMapIterableObservable<T, R> extends Observable<R> {
    final Function<? super T, ? extends Iterable<? extends R>> mapper;
    final SingleSource<T> source;

    public SingleFlatMapIterableObservable(SingleSource<T> source, Function<? super T, ? extends Iterable<? extends R>> mapper) {
        this.source = source;
        this.mapper = mapper;
    }

    @Override // io.reactivex.Observable
    protected void subscribeActual(Observer<? super R> s) {
        this.source.subscribe(new FlatMapIterableObserver(s, this.mapper));
    }

    /* loaded from: classes3.dex */
    static final class FlatMapIterableObserver<T, R> extends BasicIntQueueDisposable<R> implements SingleObserver<T> {
        private static final long serialVersionUID = -8938804753851907758L;
        final Observer<? super R> actual;
        volatile boolean cancelled;
        Disposable d;
        volatile Iterator<? extends R> it;
        final Function<? super T, ? extends Iterable<? extends R>> mapper;
        boolean outputFused;

        FlatMapIterableObserver(Observer<? super R> actual, Function<? super T, ? extends Iterable<? extends R>> mapper) {
            this.actual = actual;
            this.mapper = mapper;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            if (DisposableHelper.validate(this.d, d)) {
                this.d = d;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            Observer<? super R> a = this.actual;
            try {
                Iterator<? extends R> iterator = this.mapper.mo1190apply(value).iterator();
                boolean has = iterator.hasNext();
                if (!has) {
                    a.onComplete();
                } else if (this.outputFused) {
                    this.it = iterator;
                    a.onNext(null);
                    a.onComplete();
                } else {
                    while (!this.cancelled) {
                        try {
                            a.onNext((R) iterator.next());
                            if (!this.cancelled) {
                                try {
                                    boolean b = iterator.hasNext();
                                    if (!b) {
                                        a.onComplete();
                                        return;
                                    }
                                } catch (Throwable ex) {
                                    Exceptions.throwIfFatal(ex);
                                    a.onError(ex);
                                    return;
                                }
                            } else {
                                return;
                            }
                        } catch (Throwable ex2) {
                            Exceptions.throwIfFatal(ex2);
                            a.onError(ex2);
                            return;
                        }
                    }
                }
            } catch (Throwable ex3) {
                Exceptions.throwIfFatal(ex3);
                this.actual.onError(ex3);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            this.d = DisposableHelper.DISPOSED;
            this.actual.onError(e);
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.cancelled = true;
            this.d.dispose();
            this.d = DisposableHelper.DISPOSED;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.cancelled;
        }

        @Override // io.reactivex.internal.fuseable.QueueFuseable
        public int requestFusion(int mode) {
            if ((mode & 2) != 0) {
                this.outputFused = true;
                return 2;
            }
            return 0;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public void clear() {
            this.it = null;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        public boolean isEmpty() {
            return this.it == null;
        }

        @Override // io.reactivex.internal.fuseable.SimpleQueue
        @Nullable
        /* renamed from: poll */
        public R mo1188poll() throws Exception {
            Iterator<? extends R> iterator = this.it;
            if (iterator != null) {
                R v = (R) ObjectHelper.requireNonNull(iterator.next(), "The iterator returned a null value");
                if (!iterator.hasNext()) {
                    this.it = null;
                    return v;
                }
                return v;
            }
            return null;
        }
    }
}
