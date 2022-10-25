package com.google.android.gms.tasks;

import android.app.Activity;
import android.support.annotation.MainThread;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.internal.zzro;
import com.google.android.gms.internal.zzrp;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Executor;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class zzh<TResult> extends Task<TResult> {
    private boolean aMV;
    private TResult aMW;
    private Exception aMX;
    private final Object zzako = new Object();
    private final zzg<TResult> aMU = new zzg<>();

    /* loaded from: classes2.dex */
    private static class zza extends zzro {
        private final List<WeakReference<zzf<?>>> mListeners;

        private zza(zzrp zzrpVar) {
            super(zzrpVar);
            this.mListeners = new ArrayList();
            this.Bf.zza("TaskOnStopCallback", this);
        }

        public static zza zzw(Activity activity) {
            zzrp zzs = zzs(activity);
            zza zzaVar = (zza) zzs.zza("TaskOnStopCallback", zza.class);
            return zzaVar == null ? new zza(zzs) : zzaVar;
        }

        @Override // com.google.android.gms.internal.zzro
        @MainThread
        public void onStop() {
            synchronized (this.mListeners) {
                for (WeakReference<zzf<?>> weakReference : this.mListeners) {
                    zzf<?> zzfVar = weakReference.get();
                    if (zzfVar != null) {
                        zzfVar.cancel();
                    }
                }
                this.mListeners.clear();
            }
        }

        public <T> void zzb(zzf<T> zzfVar) {
            synchronized (this.mListeners) {
                this.mListeners.add(new WeakReference<>(zzfVar));
            }
        }
    }

    private void zzclg() {
        zzaa.zza(this.aMV, "Task is not yet complete");
    }

    private void zzclh() {
        zzaa.zza(!this.aMV, "Task is already complete");
    }

    private void zzcli() {
        synchronized (this.zzako) {
            if (!this.aMV) {
                return;
            }
            this.aMU.zza(this);
        }
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public Task<TResult> addOnCompleteListener(@NonNull Activity activity, @NonNull OnCompleteListener<TResult> onCompleteListener) {
        zzc zzcVar = new zzc(TaskExecutors.MAIN_THREAD, onCompleteListener);
        this.aMU.zza(zzcVar);
        zza.zzw(activity).zzb(zzcVar);
        zzcli();
        return this;
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public Task<TResult> addOnCompleteListener(@NonNull OnCompleteListener<TResult> onCompleteListener) {
        return addOnCompleteListener(TaskExecutors.MAIN_THREAD, onCompleteListener);
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public Task<TResult> addOnCompleteListener(@NonNull Executor executor, @NonNull OnCompleteListener<TResult> onCompleteListener) {
        this.aMU.zza(new zzc(executor, onCompleteListener));
        zzcli();
        return this;
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public Task<TResult> addOnFailureListener(@NonNull Activity activity, @NonNull OnFailureListener onFailureListener) {
        zzd zzdVar = new zzd(TaskExecutors.MAIN_THREAD, onFailureListener);
        this.aMU.zza(zzdVar);
        zza.zzw(activity).zzb(zzdVar);
        zzcli();
        return this;
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public Task<TResult> addOnFailureListener(@NonNull OnFailureListener onFailureListener) {
        return addOnFailureListener(TaskExecutors.MAIN_THREAD, onFailureListener);
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public Task<TResult> addOnFailureListener(@NonNull Executor executor, @NonNull OnFailureListener onFailureListener) {
        this.aMU.zza(new zzd(executor, onFailureListener));
        zzcli();
        return this;
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public Task<TResult> addOnSuccessListener(@NonNull Activity activity, @NonNull OnSuccessListener<? super TResult> onSuccessListener) {
        zze zzeVar = new zze(TaskExecutors.MAIN_THREAD, onSuccessListener);
        this.aMU.zza(zzeVar);
        zza.zzw(activity).zzb(zzeVar);
        zzcli();
        return this;
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public Task<TResult> addOnSuccessListener(@NonNull OnSuccessListener<? super TResult> onSuccessListener) {
        return addOnSuccessListener(TaskExecutors.MAIN_THREAD, onSuccessListener);
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public Task<TResult> addOnSuccessListener(@NonNull Executor executor, @NonNull OnSuccessListener<? super TResult> onSuccessListener) {
        this.aMU.zza(new zze(executor, onSuccessListener));
        zzcli();
        return this;
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public <TContinuationResult> Task<TContinuationResult> continueWith(@NonNull Continuation<TResult, TContinuationResult> continuation) {
        return continueWith(TaskExecutors.MAIN_THREAD, continuation);
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public <TContinuationResult> Task<TContinuationResult> continueWith(@NonNull Executor executor, @NonNull Continuation<TResult, TContinuationResult> continuation) {
        zzh zzhVar = new zzh();
        this.aMU.zza(new com.google.android.gms.tasks.zza(executor, continuation, zzhVar));
        zzcli();
        return zzhVar;
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public <TContinuationResult> Task<TContinuationResult> continueWithTask(@NonNull Continuation<TResult, Task<TContinuationResult>> continuation) {
        return continueWithTask(TaskExecutors.MAIN_THREAD, continuation);
    }

    @Override // com.google.android.gms.tasks.Task
    @NonNull
    public <TContinuationResult> Task<TContinuationResult> continueWithTask(@NonNull Executor executor, @NonNull Continuation<TResult, Task<TContinuationResult>> continuation) {
        zzh zzhVar = new zzh();
        this.aMU.zza(new zzb(executor, continuation, zzhVar));
        zzcli();
        return zzhVar;
    }

    @Override // com.google.android.gms.tasks.Task
    @Nullable
    public Exception getException() {
        Exception exc;
        synchronized (this.zzako) {
            exc = this.aMX;
        }
        return exc;
    }

    @Override // com.google.android.gms.tasks.Task
    public TResult getResult() {
        TResult tresult;
        synchronized (this.zzako) {
            zzclg();
            if (this.aMX != null) {
                throw new RuntimeExecutionException(this.aMX);
            }
            tresult = this.aMW;
        }
        return tresult;
    }

    @Override // com.google.android.gms.tasks.Task
    public <X extends Throwable> TResult getResult(@NonNull Class<X> cls) throws Throwable {
        TResult tresult;
        synchronized (this.zzako) {
            zzclg();
            if (cls.isInstance(this.aMX)) {
                throw cls.cast(this.aMX);
            }
            if (this.aMX != null) {
                throw new RuntimeExecutionException(this.aMX);
            }
            tresult = this.aMW;
        }
        return tresult;
    }

    @Override // com.google.android.gms.tasks.Task
    public boolean isComplete() {
        boolean z;
        synchronized (this.zzako) {
            z = this.aMV;
        }
        return z;
    }

    @Override // com.google.android.gms.tasks.Task
    public boolean isSuccessful() {
        boolean z;
        synchronized (this.zzako) {
            z = this.aMV && this.aMX == null;
        }
        return z;
    }

    public void setException(@NonNull Exception exc) {
        zzaa.zzb(exc, "Exception must not be null");
        synchronized (this.zzako) {
            zzclh();
            this.aMV = true;
            this.aMX = exc;
        }
        this.aMU.zza(this);
    }

    public void setResult(TResult tresult) {
        synchronized (this.zzako) {
            zzclh();
            this.aMV = true;
            this.aMW = tresult;
        }
        this.aMU.zza(this);
    }

    public boolean trySetException(@NonNull Exception exc) {
        boolean z = true;
        zzaa.zzb(exc, "Exception must not be null");
        synchronized (this.zzako) {
            if (this.aMV) {
                z = false;
            } else {
                this.aMV = true;
                this.aMX = exc;
                this.aMU.zza(this);
            }
        }
        return z;
    }

    public boolean trySetResult(TResult tresult) {
        boolean z = true;
        synchronized (this.zzako) {
            if (this.aMV) {
                z = false;
            } else {
                this.aMV = true;
                this.aMW = tresult;
                this.aMU.zza(this);
            }
        }
        return z;
    }
}
