package com.my.target.core.async.commands;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import com.my.target.Tracer;
import com.my.target.core.async.commands.b;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* compiled from: AbstractAsyncCommand.java */
/* loaded from: classes2.dex */
abstract class a<T> implements b<T> {
    private static final ExecutorService e = Executors.newSingleThreadExecutor();
    private static final ExecutorService f = Executors.newSingleThreadExecutor();
    private static final Handler g = new Handler(Looper.getMainLooper());
    protected boolean a;
    final Context b;
    T c;
    String d;
    private b.a<T> h;

    protected abstract void c();

    @Override // com.my.target.core.async.commands.b
    public final synchronized void a(b.a<T> aVar) {
        this.h = aVar;
    }

    @Override // com.my.target.core.async.commands.b
    public String a() {
        return this.d;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public a(Context context) {
        this.b = context.getApplicationContext();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public a(Context context, byte b) {
        this.b = context.getApplicationContext();
        this.a = true;
    }

    @Override // java.lang.Runnable
    public final void run() {
        c();
        synchronized (this) {
            if (this.h != null) {
                g.post(new Runnable() { // from class: com.my.target.core.async.commands.a.1
                    @Override // java.lang.Runnable
                    public final void run() {
                        synchronized (a.this) {
                            if (a.this.h != null) {
                                a.this.h.onExecute(a.this, a.this.c);
                            }
                        }
                    }
                });
            }
        }
    }

    @Override // com.my.target.core.async.commands.b
    public final void b() {
        Tracer.d("add command to " + (this.a ? "low priority" : "main") + " executor");
        if (this.a) {
            f.execute(this);
        } else {
            e.execute(this);
        }
    }
}
