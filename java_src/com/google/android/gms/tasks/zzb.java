package com.google.android.gms.tasks;

import android.support.annotation.NonNull;
import java.util.concurrent.Executor;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzb<TResult, TContinuationResult> implements OnFailureListener, OnSuccessListener<TContinuationResult>, zzf<TResult> {
    private final Executor aEQ;
    private final Continuation<TResult, Task<TContinuationResult>> aMF;
    private final zzh<TContinuationResult> aMG;

    public zzb(@NonNull Executor executor, @NonNull Continuation<TResult, Task<TContinuationResult>> continuation, @NonNull zzh<TContinuationResult> zzhVar) {
        this.aEQ = executor;
        this.aMF = continuation;
        this.aMG = zzhVar;
    }

    @Override // com.google.android.gms.tasks.zzf
    public void cancel() {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.android.gms.tasks.zzf
    public void onComplete(@NonNull final Task<TResult> task) {
        this.aEQ.execute(new Runnable() { // from class: com.google.android.gms.tasks.zzb.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Task task2 = (Task) zzb.this.aMF.then(task);
                    if (task2 == null) {
                        zzb.this.onFailure(new NullPointerException("Continuation returned null"));
                        return;
                    }
                    task2.addOnSuccessListener(TaskExecutors.aMT, zzb.this);
                    task2.addOnFailureListener(TaskExecutors.aMT, zzb.this);
                } catch (RuntimeExecutionException e) {
                    if (e.getCause() instanceof Exception) {
                        zzb.this.aMG.setException((Exception) e.getCause());
                    } else {
                        zzb.this.aMG.setException(e);
                    }
                } catch (Exception e2) {
                    zzb.this.aMG.setException(e2);
                }
            }
        });
    }

    @Override // com.google.android.gms.tasks.OnFailureListener
    public void onFailure(@NonNull Exception exc) {
        this.aMG.setException(exc);
    }

    @Override // com.google.android.gms.tasks.OnSuccessListener
    public void onSuccess(TContinuationResult tcontinuationresult) {
        this.aMG.setResult(tcontinuationresult);
    }
}
