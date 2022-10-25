package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes3.dex */
public final class CompletableMergeArray extends Completable {
    final CompletableSource[] sources;

    public CompletableMergeArray(CompletableSource[] sources) {
        this.sources = sources;
    }

    @Override // io.reactivex.Completable
    public void subscribeActual(CompletableObserver s) {
        CompositeDisposable set = new CompositeDisposable();
        AtomicBoolean once = new AtomicBoolean();
        InnerCompletableObserver shared = new InnerCompletableObserver(s, once, set, this.sources.length + 1);
        s.onSubscribe(set);
        CompletableSource[] arr$ = this.sources;
        for (CompletableSource c : arr$) {
            if (!set.isDisposed()) {
                if (c == null) {
                    set.dispose();
                    NullPointerException npe = new NullPointerException("A completable source is null");
                    shared.onError(npe);
                    return;
                }
                c.subscribe(shared);
            } else {
                return;
            }
        }
        shared.onComplete();
    }

    /* loaded from: classes3.dex */
    static final class InnerCompletableObserver extends AtomicInteger implements CompletableObserver {
        private static final long serialVersionUID = -8360547806504310570L;
        final CompletableObserver actual;
        final AtomicBoolean once;
        final CompositeDisposable set;

        InnerCompletableObserver(CompletableObserver actual, AtomicBoolean once, CompositeDisposable set, int n) {
            this.actual = actual;
            this.once = once;
            this.set = set;
            lazySet(n);
        }

        @Override // io.reactivex.CompletableObserver
        public void onSubscribe(Disposable d) {
            this.set.add(d);
        }

        @Override // io.reactivex.CompletableObserver
        public void onError(Throwable e) {
            this.set.dispose();
            if (this.once.compareAndSet(false, true)) {
                this.actual.onError(e);
            } else {
                RxJavaPlugins.onError(e);
            }
        }

        @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
        public void onComplete() {
            if (decrementAndGet() == 0 && this.once.compareAndSet(false, true)) {
                this.actual.onComplete();
            }
        }
    }
}
