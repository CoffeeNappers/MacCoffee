package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Predicate;
/* loaded from: classes3.dex */
public final class CompletableOnErrorComplete extends Completable {
    final Predicate<? super Throwable> predicate;
    final CompletableSource source;

    public CompletableOnErrorComplete(CompletableSource source, Predicate<? super Throwable> predicate) {
        this.source = source;
        this.predicate = predicate;
    }

    @Override // io.reactivex.Completable
    protected void subscribeActual(CompletableObserver s) {
        this.source.subscribe(new OnError(s));
    }

    /* loaded from: classes3.dex */
    final class OnError implements CompletableObserver {
        private final CompletableObserver s;

        OnError(CompletableObserver s) {
            this.s = s;
        }

        @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
        public void onComplete() {
            this.s.onComplete();
        }

        @Override // io.reactivex.CompletableObserver
        public void onError(Throwable e) {
            try {
                boolean b = CompletableOnErrorComplete.this.predicate.test(e);
                if (b) {
                    this.s.onComplete();
                } else {
                    this.s.onError(e);
                }
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.s.onError(new CompositeException(e, ex));
            }
        }

        @Override // io.reactivex.CompletableObserver
        public void onSubscribe(Disposable d) {
            this.s.onSubscribe(d);
        }
    }
}
