package com.google.android.gms.tasks;

import android.support.annotation.NonNull;
import java.util.concurrent.Executor;
/* loaded from: classes2.dex */
class zzd<TResult> implements zzf<TResult> {
    private final Executor aEQ;
    private OnFailureListener aMM;
    private final Object zzako = new Object();

    public zzd(@NonNull Executor executor, @NonNull OnFailureListener onFailureListener) {
        this.aEQ = executor;
        this.aMM = onFailureListener;
    }

    @Override // com.google.android.gms.tasks.zzf
    public void cancel() {
        synchronized (this.zzako) {
            this.aMM = null;
        }
    }

    @Override // com.google.android.gms.tasks.zzf
    public void onComplete(@NonNull final Task<TResult> task) {
        if (!task.isSuccessful()) {
            synchronized (this.zzako) {
                if (this.aMM != null) {
                    this.aEQ.execute(new Runnable() { // from class: com.google.android.gms.tasks.zzd.1
                        @Override // java.lang.Runnable
                        public void run() {
                            synchronized (zzd.this.zzako) {
                                if (zzd.this.aMM != null) {
                                    zzd.this.aMM.onFailure(task.getException());
                                }
                            }
                        }
                    });
                }
            }
        }
    }
}
