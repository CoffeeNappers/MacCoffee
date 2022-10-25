package io.reactivex.internal.operators.observable;

import io.reactivex.ObservableSource;
import io.reactivex.functions.Action;
import io.reactivex.functions.Consumer;
import io.reactivex.internal.functions.Functions;
import io.reactivex.internal.functions.ObjectHelper;
import io.reactivex.internal.observers.LambdaObserver;
import io.reactivex.internal.util.BlockingHelper;
import io.reactivex.internal.util.BlockingIgnoringReceiver;
import io.reactivex.internal.util.ExceptionHelper;
/* loaded from: classes3.dex */
public final class ObservableBlockingSubscribe {
    private ObservableBlockingSubscribe() {
        throw new IllegalStateException("No instances!");
    }

    /* JADX WARN: Removed duplicated region for block: B:6:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static <T> void subscribe(io.reactivex.ObservableSource<? extends T> r5, io.reactivex.Observer<? super T> r6) {
        /*
            java.util.concurrent.LinkedBlockingQueue r2 = new java.util.concurrent.LinkedBlockingQueue
            r2.<init>()
            io.reactivex.internal.observers.BlockingObserver r0 = new io.reactivex.internal.observers.BlockingObserver
            r0.<init>(r2)
            r6.onSubscribe(r0)
            r5.subscribe(r0)
        L10:
            boolean r4 = r0.isDisposed()
            if (r4 == 0) goto L17
        L16:
            return
        L17:
            java.lang.Object r3 = r2.poll()
            if (r3 != 0) goto L21
            java.lang.Object r3 = r2.take()     // Catch: java.lang.InterruptedException -> L32
        L21:
            boolean r4 = r0.isDisposed()
            if (r4 != 0) goto L16
            java.lang.Object r4 = io.reactivex.internal.observers.BlockingObserver.TERMINATED
            if (r5 == r4) goto L16
            boolean r4 = io.reactivex.internal.util.NotificationLite.acceptFull(r3, r6)
            if (r4 == 0) goto L10
            goto L16
        L32:
            r1 = move-exception
            r0.dispose()
            r6.onError(r1)
            goto L16
        */
        throw new UnsupportedOperationException("Method not decompiled: io.reactivex.internal.operators.observable.ObservableBlockingSubscribe.subscribe(io.reactivex.ObservableSource, io.reactivex.Observer):void");
    }

    public static <T> void subscribe(ObservableSource<? extends T> o) {
        BlockingIgnoringReceiver callback = new BlockingIgnoringReceiver();
        LambdaObserver<T> ls = new LambdaObserver<>(Functions.emptyConsumer(), callback, callback, Functions.emptyConsumer());
        o.subscribe(ls);
        BlockingHelper.awaitForComplete(callback, ls);
        Throwable e = callback.error;
        if (e != null) {
            throw ExceptionHelper.wrapOrThrow(e);
        }
    }

    public static <T> void subscribe(ObservableSource<? extends T> o, Consumer<? super T> onNext, Consumer<? super Throwable> onError, Action onComplete) {
        ObjectHelper.requireNonNull(onNext, "onNext is null");
        ObjectHelper.requireNonNull(onError, "onError is null");
        ObjectHelper.requireNonNull(onComplete, "onComplete is null");
        subscribe(o, new LambdaObserver(onNext, onError, onComplete, Functions.emptyConsumer()));
    }
}
