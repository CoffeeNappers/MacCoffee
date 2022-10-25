package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzrm;
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
public class zzrf implements zzqs, zzrm {
    int AB;
    final zzrm.zza AC;
    final Map<Api.zzc<?>, Api.zze> Aj;
    private final Condition Aw;
    private final zzb Ax;
    private volatile zzre Az;
    private final Context mContext;
    final Api.zza<? extends zzxp, zzxq> xQ;
    final zzrd yW;
    final com.google.android.gms.common.internal.zzf zP;
    private final Lock zg;
    final Map<Api<?>, Integer> zk;
    private final com.google.android.gms.common.zzc zm;
    final Map<Api.zzc<?>, ConnectionResult> Ay = new HashMap();
    private ConnectionResult AA = null;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static abstract class zza {
        private final zzre AD;

        /* JADX INFO: Access modifiers changed from: protected */
        public zza(zzre zzreVar) {
            this.AD = zzreVar;
        }

        protected abstract void zzaso();

        public final void zzc(zzrf zzrfVar) {
            zzrfVar.zg.lock();
            try {
                if (zzrfVar.Az != this.AD) {
                    return;
                }
                zzaso();
            } finally {
                zzrfVar.zg.unlock();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class zzb extends Handler {
        zzb(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    ((zza) message.obj).zzc(zzrf.this);
                    return;
                case 2:
                    throw ((RuntimeException) message.obj);
                default:
                    Log.w("GACStateManager", new StringBuilder(31).append("Unknown message id: ").append(message.what).toString());
                    return;
            }
        }
    }

    public zzrf(Context context, zzrd zzrdVar, Lock lock, Looper looper, com.google.android.gms.common.zzc zzcVar, Map<Api.zzc<?>, Api.zze> map, com.google.android.gms.common.internal.zzf zzfVar, Map<Api<?>, Integer> map2, Api.zza<? extends zzxp, zzxq> zzaVar, ArrayList<zzqr> arrayList, zzrm.zza zzaVar2) {
        this.mContext = context;
        this.zg = lock;
        this.zm = zzcVar;
        this.Aj = map;
        this.zP = zzfVar;
        this.zk = map2;
        this.xQ = zzaVar;
        this.yW = zzrdVar;
        this.AC = zzaVar2;
        Iterator<zzqr> it = arrayList.iterator();
        while (it.hasNext()) {
            it.next().zza(this);
        }
        this.Ax = new zzb(looper);
        this.Aw = lock.newCondition();
        this.Az = new zzrc(this);
    }

    @Override // com.google.android.gms.internal.zzrm
    public ConnectionResult blockingConnect() {
        connect();
        while (isConnecting()) {
            try {
                this.Aw.await();
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                return new ConnectionResult(15, null);
            }
        }
        return isConnected() ? ConnectionResult.wO : this.AA != null ? this.AA : new ConnectionResult(13, null);
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
                nanos = this.Aw.awaitNanos(nanos);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                return new ConnectionResult(15, null);
            }
            Thread.currentThread().interrupt();
            return new ConnectionResult(15, null);
        }
        return isConnected() ? ConnectionResult.wO : this.AA != null ? this.AA : new ConnectionResult(13, null);
    }

    @Override // com.google.android.gms.internal.zzrm
    public void connect() {
        this.Az.connect();
    }

    @Override // com.google.android.gms.internal.zzrm
    public void disconnect() {
        if (this.Az.disconnect()) {
            this.Ay.clear();
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        String concat = String.valueOf(str).concat("  ");
        printWriter.append((CharSequence) str).append("mState=").println(this.Az);
        for (Api<?> api : this.zk.keySet()) {
            printWriter.append((CharSequence) str).append((CharSequence) api.getName()).println(":");
            this.Aj.get(api.zzaqv()).dump(concat, fileDescriptor, printWriter, strArr);
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    @Nullable
    public ConnectionResult getConnectionResult(@NonNull Api<?> api) {
        Api.zzc<?> zzaqv = api.zzaqv();
        if (this.Aj.containsKey(zzaqv)) {
            if (this.Aj.get(zzaqv).isConnected()) {
                return ConnectionResult.wO;
            }
            if (this.Ay.containsKey(zzaqv)) {
                return this.Ay.get(zzaqv);
            }
        }
        return null;
    }

    @Override // com.google.android.gms.internal.zzrm
    public boolean isConnected() {
        return this.Az instanceof zzra;
    }

    @Override // com.google.android.gms.internal.zzrm
    public boolean isConnecting() {
        return this.Az instanceof zzrb;
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public void onConnected(@Nullable Bundle bundle) {
        this.zg.lock();
        try {
            this.Az.onConnected(bundle);
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
    public void onConnectionSuspended(int i) {
        this.zg.lock();
        try {
            this.Az.onConnectionSuspended(i);
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public <A extends Api.zzb, R extends Result, T extends zzqo.zza<R, A>> T zza(@NonNull T t) {
        t.zzarv();
        return (T) this.Az.zza(t);
    }

    @Override // com.google.android.gms.internal.zzqs
    public void zza(@NonNull ConnectionResult connectionResult, @NonNull Api<?> api, int i) {
        this.zg.lock();
        try {
            this.Az.zza(connectionResult, api, i);
        } finally {
            this.zg.unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(zza zzaVar) {
        this.Ax.sendMessage(this.Ax.obtainMessage(1, zzaVar));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(RuntimeException runtimeException) {
        this.Ax.sendMessage(this.Ax.obtainMessage(2, runtimeException));
    }

    @Override // com.google.android.gms.internal.zzrm
    public boolean zza(zzsa zzsaVar) {
        return false;
    }

    @Override // com.google.android.gms.internal.zzrm
    public void zzard() {
    }

    @Override // com.google.android.gms.internal.zzrm
    public void zzarz() {
        if (isConnected()) {
            ((zzra) this.Az).zzasn();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzatc() {
        this.zg.lock();
        try {
            this.Az = new zzrb(this, this.zP, this.zk, this.zm, this.xQ, this.zg, this.mContext);
            this.Az.begin();
            this.Aw.signalAll();
        } finally {
            this.zg.unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzatd() {
        this.zg.lock();
        try {
            this.yW.zzasz();
            this.Az = new zzra(this);
            this.Az.begin();
            this.Aw.signalAll();
        } finally {
            this.zg.unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzate() {
        for (Api.zze zzeVar : this.Aj.values()) {
            zzeVar.disconnect();
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T zzb(@NonNull T t) {
        t.zzarv();
        return (T) this.Az.zzb(t);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzh(ConnectionResult connectionResult) {
        this.zg.lock();
        try {
            this.AA = connectionResult;
            this.Az = new zzrc(this);
            this.Az.begin();
            this.Aw.signalAll();
        } finally {
            this.zg.unlock();
        }
    }
}
