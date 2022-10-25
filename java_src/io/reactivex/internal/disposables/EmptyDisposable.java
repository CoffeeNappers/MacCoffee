package io.reactivex.internal.disposables;

import io.reactivex.CompletableObserver;
import io.reactivex.MaybeObserver;
import io.reactivex.Observer;
import io.reactivex.SingleObserver;
import io.reactivex.annotations.Nullable;
import io.reactivex.internal.fuseable.QueueDisposable;
/* loaded from: classes3.dex */
public enum EmptyDisposable implements QueueDisposable<Object> {
    INSTANCE,
    NEVER;

    @Override // io.reactivex.disposables.Disposable
    public void dispose() {
    }

    @Override // io.reactivex.disposables.Disposable
    public boolean isDisposed() {
        return this == INSTANCE;
    }

    public static void complete(Observer<?> s) {
        s.onSubscribe(INSTANCE);
        s.onComplete();
    }

    public static void complete(MaybeObserver<?> s) {
        s.onSubscribe(INSTANCE);
        s.onComplete();
    }

    public static void error(Throwable e, Observer<?> s) {
        s.onSubscribe(INSTANCE);
        s.onError(e);
    }

    public static void complete(CompletableObserver s) {
        s.onSubscribe(INSTANCE);
        s.onComplete();
    }

    public static void error(Throwable e, CompletableObserver s) {
        s.onSubscribe(INSTANCE);
        s.onError(e);
    }

    public static void error(Throwable e, SingleObserver<?> s) {
        s.onSubscribe(INSTANCE);
        s.onError(e);
    }

    public static void error(Throwable e, MaybeObserver<?> s) {
        s.onSubscribe(INSTANCE);
        s.onError(e);
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public boolean offer(Object value) {
        throw new UnsupportedOperationException("Should not be called!");
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public boolean offer(Object v1, Object v2) {
        throw new UnsupportedOperationException("Should not be called!");
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    @Nullable
    /* renamed from: poll */
    public Object mo1188poll() throws Exception {
        return null;
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public boolean isEmpty() {
        return true;
    }

    @Override // io.reactivex.internal.fuseable.SimpleQueue
    public void clear() {
    }

    @Override // io.reactivex.internal.fuseable.QueueFuseable
    public int requestFusion(int mode) {
        return mode & 2;
    }
}
