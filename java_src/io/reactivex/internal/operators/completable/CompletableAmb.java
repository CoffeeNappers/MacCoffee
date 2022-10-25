package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;
import io.reactivex.disposables.CompositeDisposable;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.plugins.RxJavaPlugins;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes3.dex */
public final class CompletableAmb extends Completable {
    private final CompletableSource[] sources;
    private final Iterable<? extends CompletableSource> sourcesIterable;

    public CompletableAmb(CompletableSource[] sources, Iterable<? extends CompletableSource> sourcesIterable) {
        this.sources = sources;
        this.sourcesIterable = sourcesIterable;
    }

    @Override // io.reactivex.Completable
    public void subscribeActual(CompletableObserver s) {
        int count;
        CompletableSource[] sources = this.sources;
        int count2 = 0;
        if (sources == null) {
            sources = new CompletableSource[8];
            try {
                Iterator i$ = this.sourcesIterable.iterator();
                while (true) {
                    try {
                        int count3 = count2;
                        if (!i$.hasNext()) {
                            count = count3;
                            break;
                        }
                        CompletableSource element = i$.next();
                        if (element == null) {
                            EmptyDisposable.error(new NullPointerException("One of the sources is null"), s);
                            return;
                        }
                        if (count3 == sources.length) {
                            CompletableSource[] b = new CompletableSource[(count3 >> 2) + count3];
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
        s.onSubscribe(set);
        AtomicBoolean once = new AtomicBoolean();
        CompletableObserver inner = new Amb(once, set, s);
        for (int i = 0; i < count; i++) {
            CompletableSource c = sources[i];
            if (!set.isDisposed()) {
                if (c == null) {
                    NullPointerException npe = new NullPointerException("One of the sources is null");
                    if (once.compareAndSet(false, true)) {
                        set.dispose();
                        s.onError(npe);
                        return;
                    }
                    RxJavaPlugins.onError(npe);
                    return;
                }
                c.subscribe(inner);
            } else {
                return;
            }
        }
        if (count == 0) {
            s.onComplete();
        }
    }

    /* loaded from: classes3.dex */
    static final class Amb implements CompletableObserver {
        private final AtomicBoolean once;
        private final CompletableObserver s;
        private final CompositeDisposable set;

        Amb(AtomicBoolean once, CompositeDisposable set, CompletableObserver s) {
            this.once = once;
            this.set = set;
            this.s = s;
        }

        @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
        public void onComplete() {
            if (this.once.compareAndSet(false, true)) {
                this.set.dispose();
                this.s.onComplete();
            }
        }

        @Override // io.reactivex.CompletableObserver
        public void onError(Throwable e) {
            if (this.once.compareAndSet(false, true)) {
                this.set.dispose();
                this.s.onError(e);
                return;
            }
            RxJavaPlugins.onError(e);
        }

        @Override // io.reactivex.CompletableObserver
        public void onSubscribe(Disposable d) {
            this.set.add(d);
        }
    }
}
