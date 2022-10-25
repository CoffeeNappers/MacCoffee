package io.reactivex.internal.operators.maybe;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.internal.operators.maybe.MaybeMap;
import io.reactivex.internal.operators.maybe.MaybeZipArray;
import java.util.Arrays;
import java.util.Iterator;
/* loaded from: classes3.dex */
public final class MaybeZipIterable<T, R> extends Maybe<R> {
    final Iterable<? extends MaybeSource<? extends T>> sources;
    final Function<? super Object[], ? extends R> zipper;

    public MaybeZipIterable(Iterable<? extends MaybeSource<? extends T>> sources, Function<? super Object[], ? extends R> zipper) {
        this.sources = sources;
        this.zipper = zipper;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super R> observer) {
        MaybeSource<? extends T>[] a = new MaybeSource[8];
        int n = 0;
        try {
            Iterator i$ = this.sources.iterator();
            while (true) {
                try {
                    int n2 = n;
                    if (i$.hasNext()) {
                        MaybeSource<? extends T> source = i$.next();
                        if (source == null) {
                            EmptyDisposable.error(new NullPointerException("One of the sources is null"), observer);
                            return;
                        }
                        if (n2 == a.length) {
                            a = (MaybeSource[]) Arrays.copyOf(a, (n2 >> 2) + n2);
                        }
                        n = n2 + 1;
                        a[n2] = source;
                    } else if (n2 == 0) {
                        EmptyDisposable.complete(observer);
                        return;
                    } else if (n2 == 1) {
                        a[0].subscribe(new MaybeMap.MapMaybeObserver<>(observer, new SingletonArrayFunc()));
                        return;
                    } else {
                        MaybeZipArray.ZipCoordinator<T, R> parent = new MaybeZipArray.ZipCoordinator<>(observer, n2, this.zipper);
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
            return MaybeZipIterable.this.zipper.mo1190apply(new Object[]{t});
        }
    }
}
