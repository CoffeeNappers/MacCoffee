package io.reactivex.internal.schedulers;

import io.reactivex.disposables.Disposable;
import io.reactivex.internal.disposables.DisposableContainer;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicReferenceArray;
/* loaded from: classes3.dex */
public final class ScheduledRunnable extends AtomicReferenceArray<Object> implements Runnable, Callable<Object>, Disposable {
    static final Object DISPOSED = new Object();
    static final Object DONE = new Object();
    static final int FUTURE_INDEX = 1;
    static final int PARENT_INDEX = 0;
    static final int THREAD_INDEX = 2;
    private static final long serialVersionUID = -6120223772001106981L;
    final Runnable actual;

    public ScheduledRunnable(Runnable actual, DisposableContainer parent) {
        super(3);
        this.actual = actual;
        lazySet(0, parent);
    }

    @Override // java.util.concurrent.Callable
    public Object call() {
        run();
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0033 A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x003b A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0025 A[DONT_GENERATE] */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void run() {
        /*
            r8 = this;
            r7 = 0
            r6 = 2
            r5 = 1
            r4 = 0
            java.lang.Thread r2 = java.lang.Thread.currentThread()
            r8.lazySet(r6, r2)
            java.lang.Runnable r2 = r8.actual     // Catch: java.lang.Throwable -> L3c
            r2.run()     // Catch: java.lang.Throwable -> L3c
        L10:
            r8.lazySet(r6, r7)
            java.lang.Object r1 = r8.get(r4)
            java.lang.Object r2 = io.reactivex.internal.schedulers.ScheduledRunnable.DISPOSED
            if (r1 == r2) goto L2b
            if (r1 == 0) goto L2b
            java.lang.Object r2 = io.reactivex.internal.schedulers.ScheduledRunnable.DONE
            boolean r2 = r8.compareAndSet(r4, r1, r2)
            if (r2 == 0) goto L2b
            r2 = r1
            io.reactivex.internal.disposables.DisposableContainer r2 = (io.reactivex.internal.disposables.DisposableContainer) r2
            r2.delete(r8)
        L2b:
            java.lang.Object r1 = r8.get(r5)
            java.lang.Object r2 = io.reactivex.internal.schedulers.ScheduledRunnable.DISPOSED
            if (r1 == r2) goto L3b
            java.lang.Object r2 = io.reactivex.internal.schedulers.ScheduledRunnable.DONE
            boolean r2 = r8.compareAndSet(r5, r1, r2)
            if (r2 == 0) goto L2b
        L3b:
            return
        L3c:
            r0 = move-exception
            io.reactivex.plugins.RxJavaPlugins.onError(r0)     // Catch: java.lang.Throwable -> L41
            goto L10
        L41:
            r2 = move-exception
            r3 = r2
            r8.lazySet(r6, r7)
            java.lang.Object r1 = r8.get(r4)
            java.lang.Object r2 = io.reactivex.internal.schedulers.ScheduledRunnable.DISPOSED
            if (r1 == r2) goto L5e
            if (r1 == 0) goto L5e
            java.lang.Object r2 = io.reactivex.internal.schedulers.ScheduledRunnable.DONE
            boolean r2 = r8.compareAndSet(r4, r1, r2)
            if (r2 == 0) goto L5e
            r2 = r1
            io.reactivex.internal.disposables.DisposableContainer r2 = (io.reactivex.internal.disposables.DisposableContainer) r2
            r2.delete(r8)
        L5e:
            java.lang.Object r1 = r8.get(r5)
            java.lang.Object r2 = io.reactivex.internal.schedulers.ScheduledRunnable.DISPOSED
            if (r1 == r2) goto L6e
            java.lang.Object r2 = io.reactivex.internal.schedulers.ScheduledRunnable.DONE
            boolean r2 = r8.compareAndSet(r5, r1, r2)
            if (r2 == 0) goto L5e
        L6e:
            throw r3
        */
        throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.schedulers.ScheduledRunnable.run():void");
    }

    public void setFuture(Future<?> f) {
        Object o;
        boolean z = true;
        do {
            o = get(1);
            if (o != DONE) {
                if (o == DISPOSED) {
                    if (get(2) == Thread.currentThread()) {
                        z = false;
                    }
                    f.cancel(z);
                    return;
                }
            } else {
                return;
            }
        } while (!compareAndSet(1, o, f));
    }

    @Override // io.reactivex.disposables.Disposable
    public void dispose() {
        Object o;
        boolean z = true;
        while (true) {
            Object o2 = get(1);
            if (o2 == DONE || o2 == DISPOSED) {
                break;
            } else if (compareAndSet(1, o2, DISPOSED)) {
                if (o2 != null) {
                    Future future = (Future) o2;
                    if (get(2) == Thread.currentThread()) {
                        z = false;
                    }
                    future.cancel(z);
                }
            }
        }
        do {
            o = get(0);
            if (o == DONE || o == DISPOSED || o == null) {
                return;
            }
        } while (!compareAndSet(0, o, DISPOSED));
        ((DisposableContainer) o).delete(this);
    }

    @Override // io.reactivex.disposables.Disposable
    public boolean isDisposed() {
        Object o = get(1);
        return o == DISPOSED || o == DONE;
    }
}
