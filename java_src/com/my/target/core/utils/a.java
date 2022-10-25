package com.my.target.core.utils;

import android.os.Handler;
import android.os.Looper;
import java.util.Iterator;
import java.util.WeakHashMap;
/* compiled from: AdShowHandler.java */
/* loaded from: classes2.dex */
public final class a {
    private static final a a = new a();
    private final Handler b = new Handler(Looper.getMainLooper());
    private final WeakHashMap<InterfaceC0236a, Boolean> c = new WeakHashMap<>();
    private final Runnable d = new Runnable() { // from class: com.my.target.core.utils.a.1
        @Override // java.lang.Runnable
        public final void run() {
            a.this.b();
        }
    };

    /* compiled from: AdShowHandler.java */
    /* renamed from: com.my.target.core.utils.a$a  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public interface InterfaceC0236a {
        boolean a();
    }

    public static a a() {
        return a;
    }

    public final synchronized void a(InterfaceC0236a interfaceC0236a) {
        int size = this.c.size();
        if (this.c.put(interfaceC0236a, true) == null && size == 0) {
            c();
        }
    }

    public final synchronized void b(InterfaceC0236a interfaceC0236a) {
        this.c.remove(interfaceC0236a);
        if (this.c.size() == 0) {
            this.b.removeCallbacks(this.d);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void b() {
        Iterator<InterfaceC0236a> it = this.c.keySet().iterator();
        while (it.hasNext()) {
            if (it.next().a()) {
                it.remove();
            }
        }
        if (this.c.size() > 0) {
            c();
        }
    }

    private void c() {
        this.b.postDelayed(this.d, 1000L);
    }
}
