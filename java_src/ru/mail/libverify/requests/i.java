package ru.mail.libverify.requests;

import android.os.Handler;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public final class i<TW> {
    final Callable<TW> a;
    final a b;
    final b<TW> c;
    volatile Future<TW> d;
    private final ExecutorService e;

    /* loaded from: classes3.dex */
    public interface a {
        void a();
    }

    /* loaded from: classes3.dex */
    public interface b<T> {
        Handler a();

        void a(Future<T> future);
    }

    public i(@NonNull ExecutorService executorService, @NonNull Callable<TW> callable, @Nullable a aVar, @Nullable b<TW> bVar) {
        this.e = executorService;
        this.a = callable;
        this.b = aVar;
        this.c = bVar;
    }

    public final Future<TW> a() {
        final Future submit = this.e.submit(new Callable<TW>() { // from class: ru.mail.libverify.requests.i.1
            @Override // java.util.concurrent.Callable
            public final TW call() {
                try {
                    return i.this.a.call();
                } finally {
                    if (i.this.c != null && i.this.c.a() != null) {
                        i.this.c.a().post(new Runnable() { // from class: ru.mail.libverify.requests.i.1.1
                            @Override // java.lang.Runnable
                            public final void run() {
                                i.this.c.a(i.this.d);
                            }
                        });
                    }
                }
            }
        });
        this.d = new Future<TW>() { // from class: ru.mail.libverify.requests.i.2
            @Override // java.util.concurrent.Future
            public final boolean cancel(boolean z) {
                boolean cancel = submit.cancel(true);
                if (i.this.b != null) {
                    i.this.b.a();
                }
                return cancel;
            }

            @Override // java.util.concurrent.Future
            public final TW get() {
                return (TW) submit.get();
            }

            @Override // java.util.concurrent.Future
            public final TW get(long j, @NonNull TimeUnit timeUnit) {
                return (TW) submit.get(j, timeUnit);
            }

            @Override // java.util.concurrent.Future
            public final boolean isCancelled() {
                return submit.isCancelled();
            }

            @Override // java.util.concurrent.Future
            public final boolean isDone() {
                return submit.isDone();
            }
        };
        return this.d;
    }
}
