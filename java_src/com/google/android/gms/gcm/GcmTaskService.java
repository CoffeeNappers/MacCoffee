package com.google.android.gms.gcm;

import android.app.Service;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcelable;
import android.os.RemoteException;
import android.support.annotation.CallSuper;
import android.support.annotation.NonNull;
import android.util.Log;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.gcm.zzb;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes2.dex */
public abstract class GcmTaskService extends Service {
    public static final String SERVICE_ACTION_EXECUTE_TASK = "com.google.android.gms.gcm.ACTION_TASK_READY";
    public static final String SERVICE_ACTION_INITIALIZE = "com.google.android.gms.gcm.SERVICE_ACTION_INITIALIZE";
    public static final String SERVICE_PERMISSION = "com.google.android.gms.permission.BIND_NETWORK_TASK_SERVICE";
    private final Set<String> agT = new HashSet();
    private int agU;
    private ExecutorService zzahu;

    /* loaded from: classes2.dex */
    private class zza implements Runnable {
        private final zzb agX;
        private final Bundle mExtras;
        private final String mTag;

        zza(String str, IBinder iBinder, Bundle bundle) {
            this.mTag = str;
            this.agX = zzb.zza.zzgt(iBinder);
            this.mExtras = bundle;
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                this.agX.zztn(GcmTaskService.this.onRunTask(new TaskParams(this.mTag, this.mExtras)));
            } catch (RemoteException e) {
                String valueOf = String.valueOf(this.mTag);
                Log.e("GcmTaskService", valueOf.length() != 0 ? "Error reporting result of operation to scheduler for ".concat(valueOf) : new String("Error reporting result of operation to scheduler for "));
            } finally {
                GcmTaskService.this.zzkn(this.mTag);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzkn(String str) {
        synchronized (this.agT) {
            this.agT.remove(str);
            if (this.agT.size() == 0) {
                stopSelf(this.agU);
            }
        }
    }

    private void zztm(int i) {
        synchronized (this.agT) {
            this.agU = i;
            if (this.agT.size() == 0) {
                stopSelf(this.agU);
            }
        }
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    @CallSuper
    public void onCreate() {
        super.onCreate();
        this.zzahu = zzbns();
    }

    @Override // android.app.Service
    @CallSuper
    public void onDestroy() {
        super.onDestroy();
        List<Runnable> shutdownNow = this.zzahu.shutdownNow();
        if (!shutdownNow.isEmpty()) {
            Log.e("GcmTaskService", new StringBuilder(79).append("Shutting down, but not all tasks are finished executing. Remaining: ").append(shutdownNow.size()).toString());
        }
    }

    public void onInitializeTasks() {
    }

    public abstract int onRunTask(TaskParams taskParams);

    @Override // android.app.Service
    @CallSuper
    public int onStartCommand(Intent intent, int i, int i2) {
        if (intent != null) {
            try {
                intent.setExtrasClassLoader(PendingCallback.class.getClassLoader());
                String action = intent.getAction();
                if (SERVICE_ACTION_EXECUTE_TASK.equals(action)) {
                    String stringExtra = intent.getStringExtra("tag");
                    Parcelable parcelableExtra = intent.getParcelableExtra("callback");
                    Bundle bundle = (Bundle) intent.getParcelableExtra("extras");
                    if (parcelableExtra == null || !(parcelableExtra instanceof PendingCallback)) {
                        String valueOf = String.valueOf(getPackageName());
                        Log.e("GcmTaskService", new StringBuilder(String.valueOf(valueOf).length() + 47 + String.valueOf(stringExtra).length()).append(valueOf).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(stringExtra).append(": Could not process request, invalid callback.").toString());
                    } else {
                        synchronized (this.agT) {
                            if (!this.agT.add(stringExtra)) {
                                String valueOf2 = String.valueOf(getPackageName());
                                Log.w("GcmTaskService", new StringBuilder(String.valueOf(valueOf2).length() + 44 + String.valueOf(stringExtra).length()).append(valueOf2).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(stringExtra).append(": Task already running, won't start another").toString());
                            } else {
                                this.zzahu.execute(new zza(stringExtra, ((PendingCallback) parcelableExtra).getIBinder(), bundle));
                            }
                        }
                    }
                } else if (SERVICE_ACTION_INITIALIZE.equals(action)) {
                    onInitializeTasks();
                } else {
                    Log.e("GcmTaskService", new StringBuilder(String.valueOf(action).length() + 37).append("Unknown action received ").append(action).append(", terminating").toString());
                }
            } finally {
                zztm(i2);
            }
        }
        return 2;
    }

    protected ExecutorService zzbns() {
        return Executors.newFixedThreadPool(2, new ThreadFactory() { // from class: com.google.android.gms.gcm.GcmTaskService.1
            private final AtomicInteger agV = new AtomicInteger(1);

            @Override // java.util.concurrent.ThreadFactory
            public Thread newThread(@NonNull Runnable runnable) {
                Thread thread = new Thread(runnable, new StringBuilder(20).append("gcm-task#").append(this.agV.getAndIncrement()).toString());
                thread.setPriority(4);
                return thread;
            }
        });
    }
}
