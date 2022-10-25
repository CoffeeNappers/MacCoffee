package io.reactivex.internal.observers;
/* loaded from: classes3.dex */
public final class BlockingFirstObserver<T> extends BlockingBaseObserver<T> {
    @Override // io.reactivex.Observer
    public void onNext(T t) {
        if (this.value == null) {
            this.value = t;
            this.d.dispose();
            countDown();
        }
    }

    @Override // io.reactivex.Observer
    public void onError(Throwable t) {
        if (this.value == null) {
            this.error = t;
        }
        countDown();
    }
}
