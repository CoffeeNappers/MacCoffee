package com.google.android.gms.tasks;

import android.support.annotation.NonNull;
import com.google.android.gms.common.internal.zzaa;
import java.util.Arrays;
import java.util.Collection;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
/* loaded from: classes2.dex */
public final class Tasks {

    /* loaded from: classes2.dex */
    private static final class zza implements zzb {
        private final CountDownLatch zzank;

        private zza() {
            this.zzank = new CountDownLatch(1);
        }

        public void await() throws InterruptedException {
            this.zzank.await();
        }

        public boolean await(long j, TimeUnit timeUnit) throws InterruptedException {
            return this.zzank.await(j, timeUnit);
        }

        @Override // com.google.android.gms.tasks.OnFailureListener
        public void onFailure(@NonNull Exception exc) {
            this.zzank.countDown();
        }

        @Override // com.google.android.gms.tasks.OnSuccessListener
        public void onSuccess(Object obj) {
            this.zzank.countDown();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public interface zzb extends OnFailureListener, OnSuccessListener<Object> {
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static final class zzc implements zzb {
        private final zzh<Void> aMS;
        private Exception aMX;
        private final int aMZ;
        private int aNa;
        private int aNb;
        private final Object zzako = new Object();

        public zzc(int i, zzh<Void> zzhVar) {
            this.aMZ = i;
            this.aMS = zzhVar;
        }

        private void zzclj() {
            if (this.aNa + this.aNb == this.aMZ) {
                if (this.aMX == null) {
                    this.aMS.setResult(null);
                    return;
                }
                zzh<Void> zzhVar = this.aMS;
                int i = this.aNb;
                zzhVar.setException(new ExecutionException(new StringBuilder(54).append(i).append(" out of ").append(this.aMZ).append(" underlying tasks failed").toString(), this.aMX));
            }
        }

        @Override // com.google.android.gms.tasks.OnFailureListener
        public void onFailure(@NonNull Exception exc) {
            synchronized (this.zzako) {
                this.aNb++;
                this.aMX = exc;
                zzclj();
            }
        }

        @Override // com.google.android.gms.tasks.OnSuccessListener
        public void onSuccess(Object obj) {
            synchronized (this.zzako) {
                this.aNa++;
                zzclj();
            }
        }
    }

    private Tasks() {
    }

    public static <TResult> TResult await(@NonNull Task<TResult> task) throws ExecutionException, InterruptedException {
        zzaa.zzawk();
        zzaa.zzb(task, "Task must not be null");
        if (task.isComplete()) {
            return (TResult) zzb(task);
        }
        zza zzaVar = new zza();
        zza(task, zzaVar);
        zzaVar.await();
        return (TResult) zzb(task);
    }

    public static <TResult> TResult await(@NonNull Task<TResult> task, long j, @NonNull TimeUnit timeUnit) throws ExecutionException, InterruptedException, TimeoutException {
        zzaa.zzawk();
        zzaa.zzb(task, "Task must not be null");
        zzaa.zzb(timeUnit, "TimeUnit must not be null");
        if (task.isComplete()) {
            return (TResult) zzb(task);
        }
        zza zzaVar = new zza();
        zza(task, zzaVar);
        if (zzaVar.await(j, timeUnit)) {
            return (TResult) zzb(task);
        }
        throw new TimeoutException("Timed out waiting for Task");
    }

    public static <TResult> Task<TResult> call(@NonNull Callable<TResult> callable) {
        return call(TaskExecutors.MAIN_THREAD, callable);
    }

    public static <TResult> Task<TResult> call(@NonNull Executor executor, @NonNull final Callable<TResult> callable) {
        zzaa.zzb(executor, "Executor must not be null");
        zzaa.zzb(callable, "Callback must not be null");
        final zzh zzhVar = new zzh();
        executor.execute(new Runnable() { // from class: com.google.android.gms.tasks.Tasks.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    zzh.this.setResult(callable.call());
                } catch (Exception e) {
                    zzh.this.setException(e);
                }
            }
        });
        return zzhVar;
    }

    public static <TResult> Task<TResult> forException(@NonNull Exception exc) {
        zzh zzhVar = new zzh();
        zzhVar.setException(exc);
        return zzhVar;
    }

    public static <TResult> Task<TResult> forResult(TResult tresult) {
        zzh zzhVar = new zzh();
        zzhVar.setResult(tresult);
        return zzhVar;
    }

    public static Task<Void> whenAll(Collection<? extends Task<?>> collection) {
        if (collection.isEmpty()) {
            return forResult(null);
        }
        for (Task<?> task : collection) {
            if (task == null) {
                throw new NullPointerException("null tasks are not accepted");
            }
        }
        zzh zzhVar = new zzh();
        zzc zzcVar = new zzc(collection.size(), zzhVar);
        for (Task<?> task2 : collection) {
            zza(task2, zzcVar);
        }
        return zzhVar;
    }

    public static Task<Void> whenAll(Task<?>... taskArr) {
        return taskArr.length == 0 ? forResult(null) : whenAll(Arrays.asList(taskArr));
    }

    private static void zza(Task<?> task, zzb zzbVar) {
        task.addOnSuccessListener(TaskExecutors.aMT, zzbVar);
        task.addOnFailureListener(TaskExecutors.aMT, zzbVar);
    }

    private static <TResult> TResult zzb(Task<TResult> task) throws ExecutionException {
        if (task.isSuccessful()) {
            return task.getResult();
        }
        throw new ExecutionException(task.getException());
    }
}
