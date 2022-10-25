package com.google.android.gms.internal;

import android.content.Context;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
/* loaded from: classes2.dex */
public class zzqu implements zzrm {
    private final zzrh xy;
    private final Lock zg;
    private final Map<Api.zzc<?>, com.google.android.gms.common.api.zzc<?>> zj = new HashMap();
    private final Map<Api<?>, Integer> zk;
    private final zzrd zl;
    private final com.google.android.gms.common.zzc zm;
    private final Condition zn;
    private boolean zo;
    private Map<zzql<?>, ConnectionResult> zp;
    private ConnectionResult zq;
    private final Looper zzajy;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zza implements OnFailureListener, OnSuccessListener<Void> {
        private zza() {
        }

        @Nullable
        private ConnectionResult zzash() {
            int intValue;
            ConnectionResult connectionResult = null;
            int i = 0;
            for (Api api : zzqu.this.zk.keySet()) {
                ConnectionResult connectionResult2 = (ConnectionResult) zzqu.this.zp.get(((com.google.android.gms.common.api.zzc) zzqu.this.zj.get(api.zzaqv())).getApiKey());
                if (!connectionResult2.isSuccess() && (intValue = ((Integer) zzqu.this.zk.get(api)).intValue()) != 2 && (intValue != 1 || connectionResult2.hasResolution() || zzqu.this.zm.isUserResolvableError(connectionResult2.getErrorCode()))) {
                    int priority = api.zzaqs().getPriority();
                    if (connectionResult != null && i <= priority) {
                        priority = i;
                        connectionResult2 = connectionResult;
                    }
                    i = priority;
                    connectionResult = connectionResult2;
                }
            }
            return connectionResult;
        }

        @Override // com.google.android.gms.tasks.OnFailureListener
        public void onFailure(@NonNull Exception exc) {
            com.google.android.gms.common.api.zzb zzbVar = (com.google.android.gms.common.api.zzb) exc;
            zzqu.this.zg.lock();
            try {
                zzqu.this.zp = zzbVar.zzara();
                zzqu.this.zq = zzash();
                if (zzqu.this.zq == null) {
                    zzqu.this.zl.zzn(null);
                } else {
                    zzqu.this.zo = false;
                    zzqu.this.zl.zzc(zzqu.this.zq);
                }
                zzqu.this.zn.signalAll();
            } finally {
                zzqu.this.zg.unlock();
            }
        }

        @Override // com.google.android.gms.tasks.OnSuccessListener
        /* renamed from: zza */
        public void onSuccess(Void r5) {
            zzqu.this.zg.lock();
            try {
                zzqu.this.zp = new ArrayMap(zzqu.this.zj.size());
                for (Api.zzc zzcVar : zzqu.this.zj.keySet()) {
                    zzqu.this.zp.put(((com.google.android.gms.common.api.zzc) zzqu.this.zj.get(zzcVar)).getApiKey(), ConnectionResult.wO);
                }
                zzqu.this.zl.zzn(null);
                zzqu.this.zn.signalAll();
            } finally {
                zzqu.this.zg.unlock();
            }
        }
    }

    public zzqu(Context context, Lock lock, Looper looper, com.google.android.gms.common.zzc zzcVar, Map<Api.zzc<?>, Api.zze> map, Map<Api<?>, Integer> map2, ArrayList<zzqr> arrayList, zzrd zzrdVar) {
        this.zg = lock;
        this.zzajy = looper;
        this.zn = lock.newCondition();
        this.zm = zzcVar;
        this.zl = zzrdVar;
        this.zk = map2;
        HashMap hashMap = new HashMap();
        for (Api<?> api : map2.keySet()) {
            hashMap.put(api.zzaqv(), api);
        }
        HashMap hashMap2 = new HashMap();
        Iterator<zzqr> it = arrayList.iterator();
        while (it.hasNext()) {
            zzqr next = it.next();
            hashMap2.put(next.vS, next);
        }
        for (Map.Entry<Api.zzc<?>, Api.zze> entry : map.entrySet()) {
            Api api2 = (Api) hashMap.get(entry.getKey());
            this.zj.put(entry.getKey(), new com.google.android.gms.common.api.zzc(context, api2, looper, entry.getValue(), (zzqr) hashMap2.get(api2)) { // from class: com.google.android.gms.internal.zzqu.1
            });
        }
        this.xy = zzrh.zzatg();
    }

    @Override // com.google.android.gms.internal.zzrm
    public ConnectionResult blockingConnect() {
        connect();
        while (isConnecting()) {
            try {
                this.zn.await();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                return new ConnectionResult(15, null);
            }
        }
        return isConnected() ? ConnectionResult.wO : this.zq != null ? this.zq : new ConnectionResult(13, null);
    }

    @Override // com.google.android.gms.internal.zzrm
    public ConnectionResult blockingConnect(long j, TimeUnit timeUnit) {
        connect();
        long nanos = timeUnit.toNanos(j);
        while (isConnecting()) {
            if (nanos <= 0) {
                disconnect();
                return new ConnectionResult(14, null);
            }
            try {
                nanos = this.zn.awaitNanos(nanos);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                return new ConnectionResult(15, null);
            }
            Thread.currentThread().interrupt();
            return new ConnectionResult(15, null);
        }
        return isConnected() ? ConnectionResult.wO : this.zq != null ? this.zq : new ConnectionResult(13, null);
    }

    @Override // com.google.android.gms.internal.zzrm
    public void connect() {
        this.zg.lock();
        try {
            if (this.zo) {
                return;
            }
            this.zo = true;
            this.zp = null;
            this.zq = null;
            zza zzaVar = new zza();
            zzsv zzsvVar = new zzsv(this.zzajy);
            this.xy.zza(this.zj.values()).addOnSuccessListener(zzsvVar, zzaVar).addOnFailureListener(zzsvVar, zzaVar);
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public void disconnect() {
        this.zg.lock();
        try {
            this.zo = false;
            this.zp = null;
            this.zq = null;
            this.zn.signalAll();
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
    }

    @Override // com.google.android.gms.internal.zzrm
    @Nullable
    public ConnectionResult getConnectionResult(@NonNull Api<?> api) {
        this.zg.lock();
        try {
            if (this.zj.get(api.zzaqv()).getClient().isConnected()) {
                return ConnectionResult.wO;
            }
            if (this.zp != null) {
                return this.zp.get(this.zj.get(api.zzaqv()).getApiKey());
            }
            this.zg.unlock();
            return null;
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public boolean isConnected() {
        boolean z;
        this.zg.lock();
        try {
            if (this.zp != null) {
                if (this.zq == null) {
                    z = true;
                    return z;
                }
            }
            z = false;
            return z;
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public boolean isConnecting() {
        boolean z;
        this.zg.lock();
        try {
            if (this.zp == null) {
                if (this.zo) {
                    z = true;
                    return z;
                }
            }
            z = false;
            return z;
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public <A extends Api.zzb, R extends Result, T extends zzqo.zza<R, A>> T zza(@NonNull T t) {
        this.zl.Ap.zzb(t);
        return (T) this.zj.get(t.zzaqv()).doRead((com.google.android.gms.common.api.zzc<?>) t);
    }

    @Override // com.google.android.gms.internal.zzrm
    public boolean zza(zzsa zzsaVar) {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.android.gms.internal.zzrm
    public void zzard() {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.android.gms.internal.zzrm
    public void zzarz() {
    }

    @Override // com.google.android.gms.internal.zzrm
    public <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T zzb(@NonNull T t) {
        this.zl.Ap.zzb(t);
        return (T) this.zj.get(t.zzaqv()).doWrite((com.google.android.gms.common.api.zzc<?>) t);
    }
}
