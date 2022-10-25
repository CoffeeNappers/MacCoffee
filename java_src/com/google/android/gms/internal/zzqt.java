package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.ArrayMap;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzrm;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Lock;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class zzqt implements zzrm {
    private final Context mContext;
    private final zzrd yW;
    private final zzrf yX;
    private final zzrf yY;
    private final Map<Api.zzc<?>, zzrf> yZ;
    private final Api.zze zb;
    private Bundle zc;
    private final Lock zg;
    private final Looper zzajy;
    private final Set<zzsa> za = Collections.newSetFromMap(new WeakHashMap());
    private ConnectionResult zd = null;
    private ConnectionResult ze = null;
    private boolean zf = false;
    private int zh = 0;

    /* loaded from: classes2.dex */
    private class zza implements zzrm.zza {
        private zza() {
        }

        @Override // com.google.android.gms.internal.zzrm.zza
        public void zzc(int i, boolean z) {
            zzqt.this.zg.lock();
            try {
                if (zzqt.this.zf || zzqt.this.ze == null || !zzqt.this.ze.isSuccess()) {
                    zzqt.this.zf = false;
                    zzqt.this.zzb(i, z);
                    return;
                }
                zzqt.this.zf = true;
                zzqt.this.yY.onConnectionSuspended(i);
            } finally {
                zzqt.this.zg.unlock();
            }
        }

        @Override // com.google.android.gms.internal.zzrm.zza
        public void zzc(@NonNull ConnectionResult connectionResult) {
            zzqt.this.zg.lock();
            try {
                zzqt.this.zd = connectionResult;
                zzqt.this.zzasc();
            } finally {
                zzqt.this.zg.unlock();
            }
        }

        @Override // com.google.android.gms.internal.zzrm.zza
        public void zzn(@Nullable Bundle bundle) {
            zzqt.this.zg.lock();
            try {
                zzqt.this.zzm(bundle);
                zzqt.this.zd = ConnectionResult.wO;
                zzqt.this.zzasc();
            } finally {
                zzqt.this.zg.unlock();
            }
        }
    }

    /* loaded from: classes2.dex */
    private class zzb implements zzrm.zza {
        private zzb() {
        }

        @Override // com.google.android.gms.internal.zzrm.zza
        public void zzc(int i, boolean z) {
            zzqt.this.zg.lock();
            try {
                if (zzqt.this.zf) {
                    zzqt.this.zf = false;
                    zzqt.this.zzb(i, z);
                    return;
                }
                zzqt.this.zf = true;
                zzqt.this.yX.onConnectionSuspended(i);
            } finally {
                zzqt.this.zg.unlock();
            }
        }

        @Override // com.google.android.gms.internal.zzrm.zza
        public void zzc(@NonNull ConnectionResult connectionResult) {
            zzqt.this.zg.lock();
            try {
                zzqt.this.ze = connectionResult;
                zzqt.this.zzasc();
            } finally {
                zzqt.this.zg.unlock();
            }
        }

        @Override // com.google.android.gms.internal.zzrm.zza
        public void zzn(@Nullable Bundle bundle) {
            zzqt.this.zg.lock();
            try {
                zzqt.this.ze = ConnectionResult.wO;
                zzqt.this.zzasc();
            } finally {
                zzqt.this.zg.unlock();
            }
        }
    }

    private zzqt(Context context, zzrd zzrdVar, Lock lock, Looper looper, com.google.android.gms.common.zzc zzcVar, Map<Api.zzc<?>, Api.zze> map, Map<Api.zzc<?>, Api.zze> map2, com.google.android.gms.common.internal.zzf zzfVar, Api.zza<? extends zzxp, zzxq> zzaVar, Api.zze zzeVar, ArrayList<zzqr> arrayList, ArrayList<zzqr> arrayList2, Map<Api<?>, Integer> map3, Map<Api<?>, Integer> map4) {
        this.mContext = context;
        this.yW = zzrdVar;
        this.zg = lock;
        this.zzajy = looper;
        this.zb = zzeVar;
        this.yX = new zzrf(context, this.yW, lock, looper, zzcVar, map2, null, map4, null, arrayList2, new zza());
        this.yY = new zzrf(context, this.yW, lock, looper, zzcVar, map, zzfVar, map3, zzaVar, arrayList, new zzb());
        ArrayMap arrayMap = new ArrayMap();
        for (Api.zzc<?> zzcVar2 : map2.keySet()) {
            arrayMap.put(zzcVar2, this.yX);
        }
        for (Api.zzc<?> zzcVar3 : map.keySet()) {
            arrayMap.put(zzcVar3, this.yY);
        }
        this.yZ = Collections.unmodifiableMap(arrayMap);
    }

    public static zzqt zza(Context context, zzrd zzrdVar, Lock lock, Looper looper, com.google.android.gms.common.zzc zzcVar, Map<Api.zzc<?>, Api.zze> map, com.google.android.gms.common.internal.zzf zzfVar, Map<Api<?>, Integer> map2, Api.zza<? extends zzxp, zzxq> zzaVar, ArrayList<zzqr> arrayList) {
        Api.zze zzeVar = null;
        ArrayMap arrayMap = new ArrayMap();
        ArrayMap arrayMap2 = new ArrayMap();
        for (Map.Entry<Api.zzc<?>, Api.zze> entry : map.entrySet()) {
            Api.zze value = entry.getValue();
            if (value.zzajc()) {
                zzeVar = value;
            }
            if (value.zzain()) {
                arrayMap.put(entry.getKey(), value);
            } else {
                arrayMap2.put(entry.getKey(), value);
            }
        }
        com.google.android.gms.common.internal.zzaa.zza(!arrayMap.isEmpty(), "CompositeGoogleApiClient should not be used without any APIs that require sign-in.");
        ArrayMap arrayMap3 = new ArrayMap();
        ArrayMap arrayMap4 = new ArrayMap();
        for (Api<?> api : map2.keySet()) {
            Api.zzc<?> zzaqv = api.zzaqv();
            if (arrayMap.containsKey(zzaqv)) {
                arrayMap3.put(api, map2.get(api));
            } else if (!arrayMap2.containsKey(zzaqv)) {
                throw new IllegalStateException("Each API in the apiTypeMap must have a corresponding client in the clients map.");
            } else {
                arrayMap4.put(api, map2.get(api));
            }
        }
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        Iterator<zzqr> it = arrayList.iterator();
        while (it.hasNext()) {
            zzqr next = it.next();
            if (arrayMap3.containsKey(next.vS)) {
                arrayList2.add(next);
            } else if (!arrayMap4.containsKey(next.vS)) {
                throw new IllegalStateException("Each ClientCallbacks must have a corresponding API in the apiTypeMap");
            } else {
                arrayList3.add(next);
            }
        }
        return new zzqt(context, zzrdVar, lock, looper, zzcVar, arrayMap, arrayMap2, zzfVar, zzaVar, zzeVar, arrayList2, arrayList3, arrayMap3, arrayMap4);
    }

    private void zza(ConnectionResult connectionResult) {
        switch (this.zh) {
            case 2:
                this.yW.zzc(connectionResult);
            case 1:
                zzase();
                break;
            default:
                Log.wtf("CompositeGAC", "Attempted to call failure callbacks in CONNECTION_MODE_NONE. Callbacks should be disabled via GmsClientSupervisor", new Exception());
                break;
        }
        this.zh = 0;
    }

    private void zzasb() {
        this.ze = null;
        this.zd = null;
        this.yX.connect();
        this.yY.connect();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzasc() {
        if (zzb(this.zd)) {
            if (zzb(this.ze) || zzasf()) {
                zzasd();
            } else if (this.ze == null) {
            } else {
                if (this.zh == 1) {
                    zzase();
                    return;
                }
                zza(this.ze);
                this.yX.disconnect();
            }
        } else if (this.zd != null && zzb(this.ze)) {
            this.yY.disconnect();
            zza(this.zd);
        } else if (this.zd == null || this.ze == null) {
        } else {
            ConnectionResult connectionResult = this.zd;
            if (this.yY.AB < this.yX.AB) {
                connectionResult = this.ze;
            }
            zza(connectionResult);
        }
    }

    private void zzasd() {
        switch (this.zh) {
            case 2:
                this.yW.zzn(this.zc);
            case 1:
                zzase();
                break;
            default:
                Log.wtf("CompositeGAC", "Attempted to call success callbacks in CONNECTION_MODE_NONE. Callbacks should be disabled via GmsClientSupervisor", new AssertionError());
                break;
        }
        this.zh = 0;
    }

    private void zzase() {
        for (zzsa zzsaVar : this.za) {
            zzsaVar.zzajb();
        }
        this.za.clear();
    }

    private boolean zzasf() {
        return this.ze != null && this.ze.getErrorCode() == 4;
    }

    @Nullable
    private PendingIntent zzasg() {
        if (this.zb == null) {
            return null;
        }
        return PendingIntent.getActivity(this.mContext, this.yW.getSessionId(), this.zb.zzajd(), 134217728);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzb(int i, boolean z) {
        this.yW.zzc(i, z);
        this.ze = null;
        this.zd = null;
    }

    private static boolean zzb(ConnectionResult connectionResult) {
        return connectionResult != null && connectionResult.isSuccess();
    }

    private boolean zzc(zzqo.zza<? extends Result, ? extends Api.zzb> zzaVar) {
        Api.zzc<? extends Api.zzb> zzaqv = zzaVar.zzaqv();
        com.google.android.gms.common.internal.zzaa.zzb(this.yZ.containsKey(zzaqv), "GoogleApiClient is not configured to use the API required for this call.");
        return this.yZ.get(zzaqv).equals(this.yY);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzm(Bundle bundle) {
        if (this.zc == null) {
            this.zc = bundle;
        } else if (bundle == null) {
        } else {
            this.zc.putAll(bundle);
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public ConnectionResult blockingConnect() {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.android.gms.internal.zzrm
    public ConnectionResult blockingConnect(long j, @NonNull TimeUnit timeUnit) {
        throw new UnsupportedOperationException();
    }

    @Override // com.google.android.gms.internal.zzrm
    public void connect() {
        this.zh = 2;
        this.zf = false;
        zzasb();
    }

    @Override // com.google.android.gms.internal.zzrm
    public void disconnect() {
        this.ze = null;
        this.zd = null;
        this.zh = 0;
        this.yX.disconnect();
        this.yY.disconnect();
        zzase();
    }

    @Override // com.google.android.gms.internal.zzrm
    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        printWriter.append((CharSequence) str).append("authClient").println(":");
        this.yY.dump(String.valueOf(str).concat("  "), fileDescriptor, printWriter, strArr);
        printWriter.append((CharSequence) str).append("anonClient").println(":");
        this.yX.dump(String.valueOf(str).concat("  "), fileDescriptor, printWriter, strArr);
    }

    @Override // com.google.android.gms.internal.zzrm
    @Nullable
    public ConnectionResult getConnectionResult(@NonNull Api<?> api) {
        return this.yZ.get(api.zzaqv()).equals(this.yY) ? zzasf() ? new ConnectionResult(4, zzasg()) : this.yY.getConnectionResult(api) : this.yX.getConnectionResult(api);
    }

    /* JADX WARN: Code restructure failed: missing block: B:10:0x001c, code lost:
        if (r2.zh == 1) goto L12;
     */
    @Override // com.google.android.gms.internal.zzrm
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean isConnected() {
        /*
            r2 = this;
            r0 = 1
            java.util.concurrent.locks.Lock r1 = r2.zg
            r1.lock()
            com.google.android.gms.internal.zzrf r1 = r2.yX     // Catch: java.lang.Throwable -> L26
            boolean r1 = r1.isConnected()     // Catch: java.lang.Throwable -> L26
            if (r1 == 0) goto L24
            boolean r1 = r2.zzasa()     // Catch: java.lang.Throwable -> L26
            if (r1 != 0) goto L1e
            boolean r1 = r2.zzasf()     // Catch: java.lang.Throwable -> L26
            if (r1 != 0) goto L1e
            int r1 = r2.zh     // Catch: java.lang.Throwable -> L26
            if (r1 != r0) goto L24
        L1e:
            java.util.concurrent.locks.Lock r1 = r2.zg
            r1.unlock()
            return r0
        L24:
            r0 = 0
            goto L1e
        L26:
            r0 = move-exception
            java.util.concurrent.locks.Lock r1 = r2.zg
            r1.unlock()
            throw r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzqt.isConnected():boolean");
    }

    @Override // com.google.android.gms.internal.zzrm
    public boolean isConnecting() {
        this.zg.lock();
        try {
            return this.zh == 2;
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public <A extends Api.zzb, R extends Result, T extends zzqo.zza<R, A>> T zza(@NonNull T t) {
        if (zzc((zzqo.zza<? extends Result, ? extends Api.zzb>) t)) {
            if (!zzasf()) {
                return (T) this.yY.zza((zzrf) t);
            }
            t.zzaa(new Status(4, null, zzasg()));
            return t;
        }
        return (T) this.yX.zza((zzrf) t);
    }

    @Override // com.google.android.gms.internal.zzrm
    public boolean zza(zzsa zzsaVar) {
        this.zg.lock();
        try {
            if ((!isConnecting() && !isConnected()) || zzasa()) {
                this.zg.unlock();
                return false;
            }
            this.za.add(zzsaVar);
            if (this.zh == 0) {
                this.zh = 1;
            }
            this.ze = null;
            this.yY.connect();
            return true;
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public void zzard() {
        this.zg.lock();
        try {
            boolean isConnecting = isConnecting();
            this.yY.disconnect();
            this.ze = new ConnectionResult(4);
            if (isConnecting) {
                new Handler(this.zzajy).post(new Runnable() { // from class: com.google.android.gms.internal.zzqt.1
                    @Override // java.lang.Runnable
                    public void run() {
                        zzqt.this.zg.lock();
                        try {
                            zzqt.this.zzasc();
                        } finally {
                            zzqt.this.zg.unlock();
                        }
                    }
                });
            } else {
                zzase();
            }
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.internal.zzrm
    public void zzarz() {
        this.yX.zzarz();
        this.yY.zzarz();
    }

    public boolean zzasa() {
        return this.yY.isConnected();
    }

    @Override // com.google.android.gms.internal.zzrm
    public <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T zzb(@NonNull T t) {
        if (zzc((zzqo.zza<? extends Result, ? extends Api.zzb>) t)) {
            if (!zzasf()) {
                return (T) this.yY.zzb((zzrf) t);
            }
            t.zzaa(new Status(4, null, zzasg()));
            return t;
        }
        return (T) this.yX.zzb((zzrf) t);
    }
}
