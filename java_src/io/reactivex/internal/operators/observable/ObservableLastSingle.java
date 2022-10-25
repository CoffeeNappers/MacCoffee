package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.Single;
import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.NoSuchElementException;
/* loaded from: classes3.dex */
public final class ObservableLastSingle<T> extends Single<T> {
    final T defaultItem;
    final ObservableSource<T> source;

    public ObservableLastSingle(ObservableSource<T> source, T defaultItem) {
        this.source = source;
        this.defaultItem = defaultItem;
    }

    @Override // io.reactivex.Single
    protected void subscribeActual(SingleObserver<? super T> observer) {
        this.source.subscribe(new LastObserver(observer, this.defaultItem));
    }

    /* loaded from: classes3.dex */
    static final class LastObserver<T> implements Observer<T>, Disposable {
        final SingleObserver<? super T> actual;
        final T defaultItem;
        T item;
        Disposable s;

        LastObserver(SingleObserver<? super T> actual, T defaultItem) {
            this.actual = actual;
            this.defaultItem = defaultItem;
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.dispose();
            this.s = DisposableHelper.DISPOSED;
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.s == DisposableHelper.DISPOSED;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            this.item = t;
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.s = DisposableHelper.DISPOSED;
            this.item = null;
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.s = DisposableHelper.DISPOSED;
            T v = this.item;
            if (v != null) {
                this.item = null;
                this.actual.onSuccess(v);
                return;
            }
            T v2 = this.defaultItem;
            if (v2 != null) {
                this.actual.onSuccess(v2);
            } else {
                this.actual.onError(new NoSuchElementException());
            }
        }
    }
}
