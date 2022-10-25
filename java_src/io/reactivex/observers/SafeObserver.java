package io.reactivex.observers;

import io.reactivex.Observer;
import io.reactivex.disposables.Disposable;
import io.reactivex.exceptions.CompositeException;
import io.reactivex.exceptions.Exceptions;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.EmptyDisposable;
import io.reactivex.plugins.RxJavaPlugins;
/* loaded from: classes3.dex */
public final class SafeObserver<T> implements Observer<T>, Disposable {
    final Observer<? super T> actual;
    boolean done;
    Disposable s;

    public SafeObserver(Observer<? super T> actual) {
        this.actual = actual;
    }

    @Override // io.reactivex.Observer
    public void onSubscribe(Disposable s) {
        if (DisposableHelper.validate(this.s, s)) {
            this.s = s;
            try {
                this.actual.onSubscribe(this);
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                this.done = true;
                try {
                    s.dispose();
                    RxJavaPlugins.onError(e);
                } catch (Throwable e1) {
                    Exceptions.throwIfFatal(e1);
                    RxJavaPlugins.onError(new CompositeException(e, e1));
                }
            }
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
        if (!this.done) {
            if (this.s == null) {
                onNextNoSubscription();
            } else if (t == null) {
                Throwable ex = new NullPointerException("onNext called with null. Null values are generally not allowed in 2.x operators and sources.");
                try {
                    this.s.dispose();
                    onError(ex);
                } catch (Throwable e1) {
                    Exceptions.throwIfFatal(e1);
                    onError(new CompositeException(ex, e1));
                }
            } else {
                try {
                    this.actual.onNext(t);
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    try {
                        this.s.dispose();
                        onError(e);
                    } catch (Throwable e12) {
                        Exceptions.throwIfFatal(e12);
                        onError(new CompositeException(e, e12));
                    }
                }
            }
        }
    }

    void onNextNoSubscription() {
        this.done = true;
        Throwable ex = new NullPointerException("Subscription not set!");
        try {
            this.actual.onSubscribe(EmptyDisposable.INSTANCE);
            try {
                this.actual.onError(ex);
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                RxJavaPlugins.onError(new CompositeException(ex, e));
            }
        } catch (Throwable e2) {
            Exceptions.throwIfFatal(e2);
            RxJavaPlugins.onError(new CompositeException(ex, e2));
        }
    }

    @Override // io.reactivex.Observer
    public void onError(Throwable t) {
        if (this.done) {
            RxJavaPlugins.onError(t);
            return;
        }
        this.done = true;
        if (this.s == null) {
            Throwable npe = new NullPointerException("Subscription not set!");
            try {
                this.actual.onSubscribe(EmptyDisposable.INSTANCE);
                try {
                    this.actual.onError(new CompositeException(t, npe));
                    return;
                } catch (Throwable e) {
                    Exceptions.throwIfFatal(e);
                    RxJavaPlugins.onError(new CompositeException(t, npe, e));
                    return;
                }
            } catch (Throwable e2) {
                Exceptions.throwIfFatal(e2);
                RxJavaPlugins.onError(new CompositeException(t, npe, e2));
                return;
            }
        }
        if (t == null) {
            t = new NullPointerException("onError called with null. Null values are generally not allowed in 2.x operators and sources.");
        }
        try {
            this.actual.onError(t);
        } catch (Throwable ex) {
            Exceptions.throwIfFatal(ex);
            RxJavaPlugins.onError(new CompositeException(t, ex));
        }
    }

    @Override // io.reactivex.Observer
    public void onComplete() {
        if (!this.done) {
            this.done = true;
            if (this.s == null) {
                onCompleteNoSubscription();
                return;
            }
            try {
                this.actual.onComplete();
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                RxJavaPlugins.onError(e);
            }
        }
    }

    void onCompleteNoSubscription() {
        Throwable ex = new NullPointerException("Subscription not set!");
        try {
            this.actual.onSubscribe(EmptyDisposable.INSTANCE);
            try {
                this.actual.onError(ex);
            } catch (Throwable e) {
                Exceptions.throwIfFatal(e);
                RxJavaPlugins.onError(new CompositeException(ex, e));
            }
        } catch (Throwable e2) {
            Exceptions.throwIfFatal(e2);
            RxJavaPlugins.onError(new CompositeException(ex, e2));
        }
    }
}
