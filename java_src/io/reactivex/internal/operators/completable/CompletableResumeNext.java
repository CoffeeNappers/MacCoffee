package io.reactivex.internal.operators.completable;

import io.reactivex.Completable;
import io.reactivex.CompletableObserver;
import io.reactivex.CompletableSource;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.functions.Function;
import io.reactivex.internal.disposables.SequentialDisposable;
/* loaded from: classes3.dex */
public final class CompletableResumeNext extends Completable {
    final Function<? super Throwable, ? extends CompletableSource> errorMapper;
    final CompletableSource source;

    public CompletableResumeNext(CompletableSource source, Function<? super Throwable, ? extends CompletableSource> errorMapper) {
        this.source = source;
        this.errorMapper = errorMapper;
    }

    @Override // io.reactivex.Completable
    protected void subscribeActual(CompletableObserver s) {
        SequentialDisposable sd = new SequentialDisposable();
        s.onSubscribe(sd);
        this.source.subscribe(new ResumeNext(s, sd));
    }

    /* loaded from: classes3.dex */
    final class ResumeNext implements CompletableObserver {
        final CompletableObserver s;
        final SequentialDisposable sd;

        ResumeNext(CompletableObserver s, SequentialDisposable sd) {
            this.s = s;
            this.sd = sd;
        }

        @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
        public void onComplete() {
            this.s.onComplete();
        }

        @Override // io.reactivex.CompletableObserver
        public void onError(Throwable e) {
            try {
                CompletableSource c = CompletableResumeNext.this.errorMapper.mo1190apply(e);
                if (c == null) {
                    NullPointerException npe = new NullPointerException("The CompletableConsumable returned is null");
                    npe.initCause(e);
                    this.s.onError(npe);
                    return;
                }
                c.subscribe(new OnErrorObserver());
            } catch (Throwable ex) {
                Exceptions.throwIfFatal(ex);
                this.s.onError(new CompositeException(ex, e));
            }
        }

        @Override // io.reactivex.CompletableObserver
        public void onSubscribe(Disposable d) {
            this.sd.update(d);
        }

        /* loaded from: classes3.dex */
        final class OnErrorObserver implements CompletableObserver {
            OnErrorObserver() {
            }

            @Override // io.reactivex.CompletableObserver, io.reactivex.MaybeObserver
            public void onComplete() {
                ResumeNext.this.s.onComplete();
            }

            @Override // io.reactivex.CompletableObserver
            public void onError(Throwable e) {
                ResumeNext.this.s.onError(e);
            }

            @Override // io.reactivex.CompletableObserver
            public void onSubscribe(Disposable d) {
                ResumeNext.this.sd.update(d);
            }
        }
    }
}
