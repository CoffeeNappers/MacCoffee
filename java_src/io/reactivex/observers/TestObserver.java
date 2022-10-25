package io.reactivex.observers;

import io.reactivex.CompletableObserver;
import io.reactivex.MaybeObserver;
import io.reactivex.Observer;
import io.reactivex.SingleObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.fuseable.QueueDisposable;
import io.reactivex.internal.util.ExceptionHelper;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public class TestObserver<T> extends BaseTestConsumer<T, TestObserver<T>> implements Observer<T>, Disposable, MaybeObserver<T>, SingleObserver<T>, CompletableObserver {
    private final Observer<? super T> actual;
    private QueueDisposable<T> qs;
    private final AtomicReference<Disposable> subscription;

    public static <T> TestObserver<T> create() {
        return new TestObserver<>();
    }

    public static <T> TestObserver<T> create(Observer<? super T> delegate) {
        return new TestObserver<>(delegate);
    }

    public TestObserver() {
        this(EmptyObserver.INSTANCE);
    }

    public TestObserver(Observer<? super T> actual) {
        this.subscription = new AtomicReference<>();
        this.actual = actual;
    }

    @Override // io.reactivex.Observer
    public void onSubscribe(Disposable s) {
        this.lastThread = Thread.currentThread();
        if (s == null) {
            this.errors.add(new NullPointerException("onSubscribe received a null Subscription"));
        } else if (!this.subscription.compareAndSet(null, s)) {
            s.dispose();
            if (this.subscription.get() != DisposableHelper.DISPOSED) {
                this.errors.add(new IllegalStateException("onSubscribe received multiple subscriptions: " + s));
            }
        } else {
            if (this.initialFusionMode != 0 && (s instanceof QueueDisposable)) {
                this.qs = (QueueDisposable) s;
                int m = this.qs.requestFusion(this.initialFusionMode);
                this.establishedFusionMode = m;
                if (m == 1) {
                    this.checkSubscriptionOnce = true;
                    this.lastThread = Thread.currentThread();
                    while (true) {
                        try {
                            T t = this.qs.mo1188poll();
                            if (t != null) {
                                this.values.add(t);
                            } else {
                                this.completions++;
                                this.subscription.lazySet(DisposableHelper.DISPOSED);
                                return;
                            }
                        } catch (Throwable ex) {
                            this.errors.add(ex);
                            return;
                        }
                    }
                }
            }
            this.actual.onSubscribe(s);
        }
    }

    @Override // io.reactivex.Observer
    public void onNext(T t) {
        if (!this.checkSubscriptionOnce) {
            this.checkSubscriptionOnce = true;
            if (this.subscription.get() == null) {
                this.errors.add(new IllegalStateException("onSubscribe not called in proper order"));
            }
        }
        this.lastThread = Thread.currentThread();
        if (this.establishedFusionMode != 2) {
            this.values.add(t);
            if (t == null) {
                this.errors.add(new NullPointerException("onNext received a null value"));
            }
            this.actual.onNext(t);
            return;
        }
        while (true) {
            try {
                T t2 = this.qs.mo1188poll();
                if (t2 != null) {
                    this.values.add(t2);
                } else {
                    return;
                }
            } catch (Throwable ex) {
                this.errors.add(ex);
                return;
            }
        }
    }

    @Override // io.reactivex.Observer
    public void onError(Throwable t) {
        if (!this.checkSubscriptionOnce) {
            this.checkSubscriptionOnce = true;
            if (this.subscription.get() == null) {
                this.errors.add(new IllegalStateException("onSubscribe not called in proper order"));
            }
        }
        try {
            this.lastThread = Thread.currentThread();
            if (t == null) {
                this.errors.add(new NullPointerException("onError received a null Throwable"));
            } else {
                this.errors.add(t);
            }
            this.actual.onError(t);
        } finally {
            this.done.countDown();
        }
    }

    @Override // io.reactivex.Observer
    public void onComplete() {
        if (!this.checkSubscriptionOnce) {
            this.checkSubscriptionOnce = true;
            if (this.subscription.get() == null) {
                this.errors.add(new IllegalStateException("onSubscribe not called in proper order"));
            }
        }
        try {
            this.lastThread = Thread.currentThread();
            this.completions++;
            this.actual.onComplete();
        } finally {
            this.done.countDown();
        }
    }

    public final boolean isCancelled() {
        return isDisposed();
    }

    public final void cancel() {
        dispose();
    }

    @Override // io.reactivex.disposables.Disposable
    public final void dispose() {
        DisposableHelper.dispose(this.subscription);
    }

    @Override // io.reactivex.disposables.Disposable
    public final boolean isDisposed() {
        return DisposableHelper.isDisposed(this.subscription.get());
    }

    public final boolean hasSubscription() {
        return this.subscription.get() != null;
    }

    @Override // io.reactivex.observers.BaseTestConsumer
    /* renamed from: assertSubscribed  reason: collision with other method in class */
    public final TestObserver<T> mo1198assertSubscribed() {
        if (this.subscription.get() == null) {
            throw fail("Not subscribed!");
        }
        return this;
    }

    @Override // io.reactivex.observers.BaseTestConsumer
    /* renamed from: assertNotSubscribed  reason: collision with other method in class */
    public final TestObserver<T> mo1197assertNotSubscribed() {
        if (this.subscription.get() != null) {
            throw fail("Subscribed!");
        }
        if (!this.errors.isEmpty()) {
            throw fail("Not subscribed but errors found");
        }
        return this;
    }

    public final TestObserver<T> assertOf(Consumer<? super TestObserver<T>> check) {
        try {
            check.accept(this);
            return this;
        } catch (Throwable ex) {
            throw ExceptionHelper.wrapOrThrow(ex);
        }
    }

    final TestObserver<T> setInitialFusionMode(int mode) {
        this.initialFusionMode = mode;
        return this;
    }

    final TestObserver<T> assertFusionMode(int mode) {
        int m = this.establishedFusionMode;
        if (m != mode) {
            if (this.qs != null) {
                throw new AssertionError("Fusion mode different. Expected: " + fusionModeToString(mode) + ", actual: " + fusionModeToString(m));
            }
            throw fail("Upstream is not fuseable");
        }
        return this;
    }

    static String fusionModeToString(int mode) {
        switch (mode) {
            case 0:
                return "NONE";
            case 1:
                return "SYNC";
            case 2:
                return "ASYNC";
            default:
                return "Unknown(" + mode + ")";
        }
    }

    final TestObserver<T> assertFuseable() {
        if (this.qs == null) {
            throw new AssertionError("Upstream is not fuseable.");
        }
        return this;
    }

    final TestObserver<T> assertNotFuseable() {
        if (this.qs != null) {
            throw new AssertionError("Upstream is fuseable.");
        }
        return this;
    }

    @Override // io.reactivex.MaybeObserver
    public void onSuccess(T value) {
        onNext(value);
        onComplete();
    }

    /* loaded from: classes3.dex */
    enum EmptyObserver implements Observer<Object> {
        INSTANCE;

        @Override // io.reactivex.Observer
        public void onSubscribe(Disposable d) {
        }

        @Override // io.reactivex.Observer
        public void onNext(Object t) {
        }

        @Override // io.reactivex.Observer
        public void onError(Throwable t) {
        }

        @Override // io.reactivex.Observer
        public void onComplete() {
        }
    }
}
