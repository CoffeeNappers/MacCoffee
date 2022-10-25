package ru.mail.libverify.utils;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
/* loaded from: classes3.dex */
public final class b extends Handler {

    /* loaded from: classes3.dex */
    private static final class a implements Runnable {
        private final Runnable a;
        private boolean b;

        public a(Runnable runnable) {
            this.a = runnable;
        }

        public final boolean a(Handler handler) {
            if (!handler.post(this)) {
                return false;
            }
            synchronized (this) {
                if (0 > 0) {
                    long uptimeMillis = SystemClock.uptimeMillis() + 0;
                    while (!this.b) {
                        long uptimeMillis2 = uptimeMillis - SystemClock.uptimeMillis();
                        if (uptimeMillis2 <= 0) {
                            return false;
                        }
                        try {
                            wait(uptimeMillis2);
                        } catch (InterruptedException e) {
                        }
                    }
                } else {
                    while (!this.b) {
                        try {
                            wait();
                        } catch (InterruptedException e2) {
                        }
                    }
                }
                return true;
            }
        }

        @Override // java.lang.Runnable
        public final void run() {
            try {
                this.a.run();
                synchronized (this) {
                    this.b = true;
                    notifyAll();
                }
            } catch (Throwable th) {
                synchronized (this) {
                    this.b = true;
                    notifyAll();
                    throw th;
                }
            }
        }
    }

    public b() {
    }

    public b(Looper looper) {
        super(looper);
    }

    public final void a(Runnable runnable) {
        l.a();
        new a(runnable).a(this);
    }
}
