package com.google.firebase.appindexing.internal;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.RemoteException;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzrl;
import com.google.android.gms.internal.zzse;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;
import com.google.android.gms.tasks.Tasks;
import com.google.firebase.appindexing.FirebaseAppIndex;
import com.google.firebase.appindexing.FirebaseAppIndexingInvalidArgumentException;
import com.google.firebase.appindexing.Indexable;
import java.util.concurrent.Executor;
/* loaded from: classes2.dex */
public final class zzc extends FirebaseAppIndex {
    private ExecutorC0221zzc aWC;

    /* loaded from: classes2.dex */
    private static class zza extends com.google.android.gms.common.api.zzc<Api.ApiOptions.NoOptions> {
        public zza(Context context) {
            super(context, com.google.firebase.appindexing.internal.zzb.API, (Api.ApiOptions) null, Looper.getMainLooper(), new com.google.firebase.zza());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static abstract class zzb extends zzse<com.google.firebase.appindexing.internal.zzb, Status> {
        private TaskCompletionSource<Status> yg;

        private zzb() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.zzse
        /* renamed from: zza */
        public final void zzb(com.google.firebase.appindexing.internal.zzb zzbVar, TaskCompletionSource<Status> taskCompletionSource) throws RemoteException {
            this.yg = taskCompletionSource;
            zza((zzf) zzbVar.zzavg());
        }

        protected abstract void zza(zzf zzfVar) throws RemoteException;

        protected zzrl zzcom() {
            return new zzrl.zza() { // from class: com.google.firebase.appindexing.internal.zzc.zzb.1
                @Override // com.google.android.gms.internal.zzrl
                public void zzp(Status status) throws RemoteException {
                    zzb.this.yg.setResult(status);
                }
            };
        }
    }

    /* renamed from: com.google.firebase.appindexing.internal.zzc$zzc  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    static class ExecutorC0221zzc implements OnCompleteListener<Void>, Executor {
        public static int MAX_RETRIES = 10;
        public static long aWH = 250;
        public static double aWI = 1.5d;
        public static double aWJ = 0.25d;
        @NonNull
        private final com.google.android.gms.common.api.zzc<?> Bs;
        @Nullable
        private Task<Void> aWK = null;
        @NonNull
        private final Handler mHandler;

        public ExecutorC0221zzc(@NonNull com.google.android.gms.common.api.zzc<?> zzcVar) {
            this.Bs = zzcVar;
            this.mHandler = new Handler(zzcVar.getLooper());
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void zza(@NonNull final zzb zzbVar, @NonNull final TaskCompletionSource<Void> taskCompletionSource, final int i) {
            this.Bs.doWrite(zzbVar).addOnCompleteListener(this, new OnCompleteListener<Status>() { // from class: com.google.firebase.appindexing.internal.zzc.zzc.1
                @Override // com.google.android.gms.tasks.OnCompleteListener
                public void onComplete(@NonNull Task<Status> task) {
                    if (i < ExecutorC0221zzc.MAX_RETRIES && ExecutorC0221zzc.zzc(task)) {
                        Runnable runnable = new Runnable() { // from class: com.google.firebase.appindexing.internal.zzc.zzc.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                ExecutorC0221zzc.this.zza(zzbVar, taskCompletionSource, i + 1);
                            }
                        };
                        long zzafa = ExecutorC0221zzc.zzafa(i);
                        if (ExecutorC0221zzc.this.mHandler.postDelayed(runnable, zzafa)) {
                            zzg.zzrr(new StringBuilder(47).append("Task will be retried in ").append(zzafa).append(" ms").toString());
                            return;
                        }
                        zzg.zzrr("Failed to schedule retry -- failing immediately!");
                    }
                    if (!task.isSuccessful()) {
                        taskCompletionSource.setException(task.getException());
                        return;
                    }
                    Status result = task.getResult();
                    if (result.isSuccess()) {
                        taskCompletionSource.setResult(null);
                    } else {
                        taskCompletionSource.setException(zzl.zzb(result, "Indexing error, please try again."));
                    }
                }
            });
        }

        static long zzafa(int i) {
            return (long) (aWH * Math.pow(aWI, i) * ((((Math.random() * 2.0d) - 1.0d) * aWJ) + 1.0d));
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static boolean zzc(@NonNull Task<Status> task) {
            if (task.isSuccessful()) {
                return zzd.zzafb(task.getResult().getStatusCode());
            }
            return false;
        }

        @Override // java.util.concurrent.Executor
        public void execute(Runnable runnable) {
            this.mHandler.post(runnable);
        }

        @Override // com.google.android.gms.tasks.OnCompleteListener
        public synchronized void onComplete(@NonNull Task<Void> task) {
            if (task == this.aWK) {
                this.aWK = null;
            }
        }

        public Task<Void> zzb(@NonNull final zzb zzbVar) {
            Task<Void> task;
            final TaskCompletionSource<Void> taskCompletionSource = new TaskCompletionSource<>();
            Task<Void> task2 = taskCompletionSource.getTask();
            synchronized (this) {
                task = this.aWK;
                this.aWK = task2;
            }
            task2.addOnCompleteListener(this, this);
            if (task == null) {
                zza(zzbVar, taskCompletionSource, 0);
            } else {
                task.addOnCompleteListener(this, new OnCompleteListener<Void>() { // from class: com.google.firebase.appindexing.internal.zzc.zzc.2
                    @Override // com.google.android.gms.tasks.OnCompleteListener
                    public void onComplete(@NonNull Task<Void> task3) {
                        ExecutorC0221zzc.this.zza(zzbVar, taskCompletionSource, 0);
                    }
                });
            }
            return task2;
        }
    }

    public zzc(@NonNull Context context) {
        this(context, new zza(context));
    }

    zzc(@NonNull Context context, @NonNull com.google.android.gms.common.api.zzc<Api.ApiOptions.NoOptions> zzcVar) {
        this.aWC = new ExecutorC0221zzc(zzcVar);
    }

    @Override // com.google.firebase.appindexing.FirebaseAppIndex
    public Task<Void> remove(final String... strArr) {
        return this.aWC.zzb(new zzb() { // from class: com.google.firebase.appindexing.internal.zzc.2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.firebase.appindexing.internal.zzc.zzb
            protected void zza(zzf zzfVar) throws RemoteException {
                zzfVar.zza(zzcom(), strArr);
            }
        });
    }

    @Override // com.google.firebase.appindexing.FirebaseAppIndex
    public Task<Void> removeAll() {
        return this.aWC.zzb(new zzb() { // from class: com.google.firebase.appindexing.internal.zzc.3
            @Override // com.google.firebase.appindexing.internal.zzc.zzb
            protected void zza(zzf zzfVar) throws RemoteException {
                zzfVar.zze(zzcom());
            }
        });
    }

    @Override // com.google.firebase.appindexing.FirebaseAppIndex
    public Task<Void> update(Indexable... indexableArr) {
        if (indexableArr == null) {
            return Tasks.forException(new NullPointerException("Indexables cannot be null."));
        }
        final Thing[] thingArr = new Thing[indexableArr.length];
        try {
            System.arraycopy(indexableArr, 0, thingArr, 0, indexableArr.length);
            return this.aWC.zzb(new zzb() { // from class: com.google.firebase.appindexing.internal.zzc.1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super();
                }

                @Override // com.google.firebase.appindexing.internal.zzc.zzb
                protected void zza(zzf zzfVar) throws RemoteException {
                    zzfVar.zza(zzcom(), thingArr);
                }
            });
        } catch (ArrayStoreException e) {
            return Tasks.forException(new FirebaseAppIndexingInvalidArgumentException("Custom Indexable-objects are not allowed. Please use the 'Indexables'-class for creating the objects."));
        }
    }
}
