package io.reactivex.observers;

import io.reactivex.MaybeObserver;
import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableHelper;
import io.reactivex.internal.disposables.ListCompositeDisposable;
import io.reactivex.internal.functions.ObjectHelper;
import java.util.concurrent.atomic.AtomicReference;
/* loaded from: classes3.dex */
public abstract class ResourceMaybeObserver<T> implements MaybeObserver<T>, Disposable {
    private final AtomicReference<Disposable> s = new AtomicReference<>();
    private final ListCompositeDisposable resources = new ListCompositeDisposable();

    public final void add(Disposable resource) {
        ObjectHelper.requireNonNull(resource, "resource is null");
        this.resources.add(resource);
    }

    @Override // io.reactivex.MaybeObserver
    public final void onSubscribe(Disposable s) {
        if (DisposableHelper.setOnce(this.s, s)) {
            onStart();
        }
    }

    protected void onStart() {
    }

    @Override // io.reactivex.disposables.Disposable
    public final void dispose() {
        if (DisposableHelper.dispose(this.s)) {
            this.resources.dispose();
        }
    }

    @Override // io.reactivex.disposables.Disposable
    public final boolean isDisposed() {
        return DisposableHelper.isDisposed(this.s.get());
    }
}
