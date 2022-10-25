package com.google.android.gms.tasks;

import android.support.annotation.NonNull;
import java.util.concurrent.Executor;
/* loaded from: classes2.dex */
class zzc<TResult> implements zzf<TResult> {
    private final Executor aEQ;
    private OnCompleteListener<TResult> aMK;
    private final Object zzako = new Object();

    public zzc(@NonNull Executor executor, @NonNull OnCompleteListener<TResult> onCompleteListener) {
        this.aEQ = executor;
        this.aMK = onCompleteListener;
    }

    @Override // com.google.android.gms.tasks.zzf
    public void cancel() {
        synchronized (this.zzako) {
            this.aMK = null;
        }
    }

    @Override // com.google.android.gms.tasks.zzf
    public void onComplete(@NonNull final Task<TResult> task) {
        synchronized (this.zzako) {
            if (this.aMK == null) {
                return;
            }
            this.aEQ.execute(new Runnable() { // from class: com.google.android.gms.tasks.zzc.1
                @Override // java.lang.Runnable
                public void run() {
                    synchronized (zzc.this.zzako) {
                        if (zzc.this.aMK != null) {
                            zzc.this.aMK.onComplete(task);
                        }
                    }
                }
            });
        }
    }
}
