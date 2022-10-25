package com.my.tracker.async.commands;

import android.os.Handler;
import android.os.Looper;
import java.lang.ref.WeakReference;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
/* compiled from: AbstractAsyncCommand.java */
/* loaded from: classes2.dex */
public abstract class a implements d {
    private static final ExecutorService a = Executors.newSingleThreadExecutor();
    private static final Handler b = new Handler(Looper.getMainLooper());
    private WeakReference<Object> c;

    @Override // java.lang.Runnable
    public final void run() {
        try {
            e c = c();
            synchronized (this) {
                if (this.c != null && this.c.get() != null) {
                    b.post(new RunnableC0237a(this, c, (byte) 0));
                }
            }
        } catch (Throwable th) {
            com.my.tracker.a.a(th.getMessage(), th);
        }
    }

    @Override // com.my.tracker.async.commands.d
    public final void a() {
        a.execute(this);
    }

    @Override // com.my.tracker.async.commands.d
    public final Future<?> b() {
        return a.submit(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public e c() {
        return new e();
    }

    /* compiled from: AbstractAsyncCommand.java */
    /* renamed from: com.my.tracker.async.commands.a$a  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    private class RunnableC0237a implements Runnable {
        private e b;

        /* synthetic */ RunnableC0237a(a aVar, e eVar, byte b) {
            this(eVar);
        }

        private RunnableC0237a(e eVar) {
            this.b = eVar;
        }

        @Override // java.lang.Runnable
        public final void run() {
            synchronized (a.this) {
                if (a.this.c != null) {
                    a.this.c.get();
                }
            }
        }
    }
}
