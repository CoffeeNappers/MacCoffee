package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import java.util.ArrayDeque;
/* loaded from: classes3.dex */
public final class ObservableSkipLast<T> extends AbstractObservableWithUpstream<T, T> {
    final int skip;

    public ObservableSkipLast(ObservableSource<T> source, int skip) {
        super(source);
        this.skip = skip;
    }

    @Override // io.reactivex.Observable
    public void subscribeActual(Observer<? super T> s) {
        this.source.subscribe(new SkipLastObserver(s, this.skip));
    }

    /* loaded from: classes3.dex */
    static final class SkipLastObserver<T> extends ArrayDeque<T> implements Observer<T>, Disposable {
        private static final long serialVersionUID = -3807491841935125653L;
        final Observer<? super T> actual;
        Disposable s;
        final int skip;

        SkipLastObserver(Observer<? super T> actual, int skip) {
            super(skip);
            this.actual = actual;
            this.skip = skip;
        }

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable s) {
            if (DisposableHelper.validate(this.s, s)) {
                this.s = s;
                this.actual.onSubscribe(this);
            }
        }

        @Override // io.reactivex.disposables.Disposable
        public void dispose() {
            this.s.dispose();
        }

        @Override // io.reactivex.disposables.Disposable
        public boolean isDisposed() {
            return this.s.isDisposed();
        }

        @Override // io.reactivex.Observer
        public void onNext(T t) {
            if (this.skip == size()) {
                this.actual.onNext((T) poll());
            }
            offer(t);
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
            this.actual.onError(t);
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
            this.actual.onComplete();
        }
    }
}
