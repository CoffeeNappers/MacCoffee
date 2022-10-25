package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes3.dex */
public final class SingleAmb<T> extends Single<T> {
    private final SingleSource<? extends T>[] sources;
    private final Iterable<? extends SingleSource<? extends T>> sourcesIterable;

    public SingleAmb(SingleSource<? extends T>[] sources, Iterable<? extends SingleSource<? extends T>> sourcesIterable) {
        this.sources = sources;
        this.sourcesIterable = sourcesIterable;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> s) {
        int count;
        SingleSource<? extends T>[] sources = this.sources;
        int count2 = 0;
        if (sources == null) {
            sources = new SingleSource[8];
            try {
                Iterator i$ = this.sourcesIterable.iterator();
                while (true) {
                    try {
                        int count3 = count2;
                        if (!i$.hasNext()) {
                            count = count3;
                            break;
                        }
                        SingleSource<? extends T> element = i$.next();
                        if (element == null) {
                            EmptyDisposable.error(new NullPointerException("One of the sources is null"), s);
                            return;
                        }
                        if (count3 == sources.length) {
                            SingleSource<? extends T>[] b = new SingleSource[(count3 >> 2) + count3];
                            System.arraycopy(sources, 0, b, 0, count3);
                            sources = b;
                        }
                        count2 = count3 + 1;
                        sources[count3] = element;
                    } catch (Throwable th) {
                        e = th;
                        Exceptions.throwIfFatal(e);
                        EmptyDisposable.error(e, s);
                        return;
                    }
                }
            } catch (Throwable th2) {
                e = th2;
            }
        } else {
            count = sources.length;
        }
        CompositeDisposable set = new CompositeDisposable();
        AmbSingleObserver<T> shared = new AmbSingleObserver<>(s, set);
        s.onSubscribe(set);
        for (int i = 0; i < count; i++) {
            SingleSource<? extends T> s1 = sources[i];
            if (!shared.get()) {
                if (s1 == null) {
                    set.dispose();
                    Throwable e = new NullPointerException("One of the sources is null");
                    if (shared.compareAndSet(false, true)) {
                        s.onError(e);
                        return;
                    } else {
                        RxJavaPlugins.onError(e);
                        return;
                    }
                }
                s1.subscribe(shared);
            } else {
                return;
            }
        }
    }

    /* loaded from: classes3.dex */
    static final class AmbSingleObserver<T> extends AtomicBoolean implements SingleObserver<T> {
        private static final long serialVersionUID = -1944085461036028108L;
        final SingleObserver<? super T> s;
        final CompositeDisposable set;

        AmbSingleObserver(SingleObserver<? super T> s, CompositeDisposable set) {
            this.s = s;
            this.set = set;
        }

        @Override // io.reactivex.SingleObserver
        public void onSubscribe(Disposable d) {
            this.set.add(d);
        }

        @Override // io.reactivex.SingleObserver
        public void onSuccess(T value) {
            if (compareAndSet(false, true)) {
                this.set.dispose();
                this.s.onSuccess(value);
            }
        }

        @Override // io.reactivex.SingleObserver
        public void onError(Throwable e) {
            if (compareAndSet(false, true)) {
                this.set.dispose();
                this.s.onError(e);
                return;
            }
            RxJavaPlugins.onError(e);
        }
    }
}
