package io.reactivex.internal.operators.single;

import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.SingleSource;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.operators.single.SingleMap;
import io.reactivex.internal.operators.single.SingleZipArray;
import java.util.Arrays;
import java.util.Iterator;
import java.util.NoSuchElementException;
/* loaded from: classes3.dex */
public final class SingleZipIterable<T, R> extends Single<R> {
    final Iterable<? extends SingleSource<? extends T>> sources;
    final Function<? super Object[], ? extends R> zipper;

    public SingleZipIterable(Iterable<? extends SingleSource<? extends T>> sources, Function<? super Object[], ? extends R> zipper) {
        this.sources = sources;
        this.zipper = zipper;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super R> observer) {
        SingleSource<? extends T>[] a = new SingleSource[8];
        int n = 0;
        try {
            Iterator i$ = this.sources.iterator();
            while (true) {
                try {
                    int n2 = n;
                    if (i$.hasNext()) {
                        SingleSource<? extends T> source = i$.next();
                        if (source == null) {
                            EmptyDisposable.error(new NullPointerException("One of the sources is null"), observer);
                            return;
                        }
                        if (n2 == a.length) {
                            a = (SingleSource[]) Arrays.copyOf(a, (n2 >> 2) + n2);
                        }
                        n = n2 + 1;
                        a[n2] = source;
                    } else if (n2 == 0) {
                        EmptyDisposable.error(new NoSuchElementException(), observer);
                        return;
                    } else if (n2 == 1) {
                        a[0].subscribe(new SingleMap.MapSingleObserver<>(observer, new SingletonArrayFunc()));
                        return;
                    } else {
                        SingleZipArray.ZipCoordinator<T, R> parent = new SingleZipArray.ZipCoordinator<>(observer, n2, this.zipper);
                        observer.onSubscribe(parent);
                        for (int i = 0; i < n2 && !parent.isDisposed(); i++) {
                            a[i].subscribe(parent.observers[i]);
                        }
                        return;
                    }
                } catch (Throwable th) {
                    ex = th;
                    Exceptions.throwIfFatal(ex);
                    EmptyDisposable.error(ex, observer);
                    return;
                }
            }
        } catch (Throwable th2) {
            ex = th2;
        }
    }

    /* loaded from: classes3.dex */
    final class SingletonArrayFunc implements Function<T, R> {
        SingletonArrayFunc() {
        }

        /* JADX WARN: Type inference failed for: r1v1, types: [java.lang.Object[], java.lang.Object] */
        @Override // io.reactivex.functions.Function
        /* renamed from: apply */
        public R mo1190apply(T t) throws Exception {
            return SingleZipIterable.this.zipper.mo1190apply(new Object[]{t});
        }
    }
}
