package io.reactivex.internal.operators.maybe;

import io.reactivex.Maybe;
import io.reactivex.MaybeObserver;
import io.reactivex.MaybeSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.operators.maybe.MaybeMap;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public final class MaybeZipArray<T, R> extends Maybe<R> {
    final MaybeSource<? extends T>[] sources;
    final Function<? super Object[], ? extends R> zipper;

    public MaybeZipArray(MaybeSource<? extends T>[] sources, Function<? super Object[], ? extends R> zipper) {
        this.sources = sources;
        this.zipper = zipper;
    }

    @Override // io.reactivex.Maybe
    protected void subscribeActual(MaybeObserver<? super R> observer) {
        MaybeSource<? extends T>[] sources = this.sources;
        int n = sources.length;
        if (n == 1) {
            sources[0].subscribe(new MaybeMap.MapMaybeObserver(observer, new SingletonArrayFunc()));
            return;
        }
        ZipCoordinator<T, R> parent = new ZipCoordinator<>(observer, n, this.zipper);
        observer.onSubscribe(parent);
        for (int i = 0; i < n && !parent.isDisposed(); i++) {
            MaybeSource<? extends T> source = sources[i];
            if (source == null) {
                parent.innerError(new NullPointerException("One of the sources is null"), i);
                return;
            }
            source.subscribe(parent.observers[i]);
        }
    }

    /* loaded from: classes3.dex */
    static final class ZipCoordinator<T, R> extends AtomicInteger implements Disposable {
        private static final long serialVersionUID = -5556924161382950569L;
        final MaybeObserver<? super R> actual;
        final ZipMaybeObserver<T>[] observers;
        final Object[] values;
        final Function<? super Object[], ? extends R> zipper;

        /* JADX INFO: Access modifiers changed from: package-private */
        public ZipCoordinator(MaybeObserver<? super R> observer, int n, Function<? super Object[], ? extends R> zipper) {
            super(n);
            this.actual = observer;
            this.zipper = zipper;
            ZipMaybeObserver<T>[] o = new ZipMaybeObserver[n];
            for (int i = 0; i < n; i++) {
                o[i] = new ZipMaybeObserver<>(this, i);
            }
            this.observers = o;
            this.values = new Object[n];
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return get() <= 0;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            if (getAndSet(0) > 0) {
                ZipMaybeObserver[] arr$ = this.observers;
                for (ZipMaybeObserver zipMaybeObserver : arr$) {
                    zipMaybeObserver.dispose();
                }
            }
        }

        void innerSuccess(T value, int index) {
            this.values[index] = value;
            if (decrementAndGet() == 0) {
                try {
                    this.actual.onSuccess(ObjectHelper.requireNonNull(this.zipper.mo1190apply(this.values), "The zipper returned a null value"));
                } catch (Throwable ex) {
                    Exceptions.throwIfFatal(ex);
                    this.actual.onError(ex);
                }
            }
        }

        void disposeExcept(int index) {
            ZipMaybeObserver<T>[] observers = this.observers;
            int n = observers.length;
            for (int i = 0; i < index; i++) {
                observers[i].dispose();
            }
            for (int i2 = index + 1; i2 < n; i2++) {
                observers[i2].dispose();
            }
        }

        void innerError(Throwable ex, int index) {
            if (getAndSet(0) > 0) {
                disposeExcept(index);
                this.actual.onError(ex);
                return;
            }
            RxJavaPlugins.onError(ex);
        }

        void innerComplete(int index) {
            if (getAndSet(0) > 0) {
                disposeExcept(index);
                this.actual.onComplete();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public static final class ZipMaybeObserver<T> extends AtomicReference<Disposable> implements MaybeObserver<T> {
        private static final long serialVersionUID = 3323743579927613702L;
        final int index;
        final ZipCoordinator<T, ?> parent;

        ZipMaybeObserver(ZipCoordinator<T, ?> parent, int index) {
            this.parent = parent;
            this.index = index;
        }

        public void dispose() {
            DisposableHelper.dispose(this);
        }

        @Override // io.reactivex.MaybeObserver
        public void onSubscribe(Disposable d) {
            DisposableHelper.setOnce(this, d);
        }

        @Override // io.reactivex.MaybeObserver
        public void onSuccess(T value) {
            this.parent.innerSuccess(value, this.index);
        }

        @Override // io.reactivex.MaybeObserver
        public void onError(Throwable e) {
            this.parent.innerError(e, this.index);
        }

        @Override // io.reactivex.MaybeObserver
        public void onComplete() {
            this.parent.innerComplete(this.index);
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
            return MaybeZipArray.this.zipper.mo1190apply(new Object[]{t});
        }
    }
}
