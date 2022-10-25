package com.vkontakte.android.background;
/* loaded from: classes2.dex */
public abstract class CancellableRunnable {
    private boolean isCanceled = false;
    private Runnable runnable;

    public abstract void run();

    public void cancel() {
        this.isCanceled = true;
    }

    public boolean getIsCanceled() {
        return this.isCanceled;
    }

    public Runnable toOnceRunnable() {
        if (this.runnable == null) {
            this.runnable = new Runnable() { // from class: com.vkontakte.android.background.CancellableRunnable.1
                @Override // java.lang.Runnable
                public void run() {
                    if (!CancellableRunnable.this.isCanceled) {
                        CancellableRunnable.this.isCanceled = true;
                        CancellableRunnable.this.run();
                    }
                }
            };
        }
        return this.runnable;
    }

    public Runnable toRunnable() {
        if (this.runnable == null) {
            this.runnable = new Runnable() { // from class: com.vkontakte.android.background.CancellableRunnable.2
                @Override // java.lang.Runnable
                public void run() {
                    if (!CancellableRunnable.this.isCanceled) {
                        CancellableRunnable.this.run();
                    }
                }
            };
        }
        return this.runnable;
    }
}
