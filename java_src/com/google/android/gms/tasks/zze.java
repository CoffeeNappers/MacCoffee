package com.google.android.gms.tasks;

import android.support.annotation.NonNull;
import java.util.concurrent.Executor;
/* loaded from: classes2.dex */
class zze<TResult> implements zzf<TResult> {
    private final Executor aEQ;
    private OnSuccessListener<? super TResult> aMO;
    private final Object zzako = new Object();

    public zze(@NonNull Executor executor, @NonNull OnSuccessListener<? super TResult> onSuccessListener) {
        this.aEQ = executor;
        this.aMO = onSuccessListener;
    }

    @Override // com.google.android.gms.tasks.zzf
    public void cancel() {
        synchronized (this.zzako) {
            this.aMO = null;
        }
    }

    @Override // com.google.android.gms.tasks.zzf
    public void onComplete(@NonNull final Task<TResult> task) {
        if (task.isSuccessful()) {
            synchronized (this.zzako) {
                if (this.aMO != null) {
                    this.aEQ.execute(new Runnable() { // from class: com.google.android.gms.tasks.zze.1
                        /* JADX WARN: Multi-variable type inference failed */
                        @Override // java.lang.Runnable
                        public void run() {
                            synchronized (zze.this.zzako) {
                                if (zze.this.aMO != null) {
                                    zze.this.aMO.onSuccess(task.getResult());
                                }
                            }
                        }
                    });
                }
            }
        }
    }
}
