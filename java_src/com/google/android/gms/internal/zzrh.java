package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.DeadObjectException;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.WorkerThread;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zze;
import com.google.android.gms.internal.zzqj;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzrr;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.TaskCompletionSource;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes2.dex */
public class zzrh implements Handler.Callback {
    private static zzrh AJ;
    private long AI;
    private int AK;
    private final AtomicInteger AL;
    private final AtomicInteger AM;
    private zzqw AN;
    private final Set<zzql<?>> AO;
    private final Set<zzql<?>> AP;
    private long Af;
    private long Ag;
    private final Context mContext;
    private final Handler mHandler;
    private final GoogleApiAvailability xP;
    private final Map<zzql<?>, zza<?>> zj;
    public static final Status AG = new Status(4, "Sign-out occurred while this API call was in progress.");
    private static final Status AH = new Status(4, "The user must be signed in to make this API call.");
    private static final Object zzaox = new Object();

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public class zza<O extends Api.ApiOptions> implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener, zzqs {
        private final Api.zzb AR;
        private final zzqv AS;
        private final int AV;
        private boolean Ae;
        private final Api.zze xB;
        private final zzql<O> xx;
        private final Queue<zzqj> AQ = new LinkedList();
        private final Set<zzqn> AT = new HashSet();
        private final Map<zzrr.zzb<?>, zzrx> AU = new HashMap();
        private ConnectionResult AW = null;

        @WorkerThread
        public zza(com.google.android.gms.common.api.zzc<O> zzcVar) {
            if (zzcVar.isConnectionlessGoogleApiClient()) {
                this.xB = zzcVar.getClient();
                zzcVar.getClientCallbacks().zza(this);
            } else {
                this.xB = zzcVar.buildApiClient(zzrh.this.mHandler.getLooper(), this, this);
            }
            if (this.xB instanceof com.google.android.gms.common.internal.zzag) {
                this.AR = ((com.google.android.gms.common.internal.zzag) this.xB).zzawt();
            } else {
                this.AR = this.xB;
            }
            this.xx = zzcVar.getApiKey();
            this.AS = new zzqv();
            this.AV = zzcVar.getInstanceId();
        }

        /* JADX INFO: Access modifiers changed from: private */
        @WorkerThread
        public void connect() {
            if (this.xB.isConnected() || this.xB.isConnecting()) {
                return;
            }
            if (this.xB.zzaqx() && zzrh.this.AK != 0) {
                zzrh.this.AK = zzrh.this.xP.isGooglePlayServicesAvailable(zzrh.this.mContext);
                if (zzrh.this.AK != 0) {
                    onConnectionFailed(new ConnectionResult(zzrh.this.AK, null));
                    return;
                }
            }
            if (this.xB.zzain()) {
            }
            this.xB.zza(new zzb(this.xB, this.xx));
        }

        /* JADX INFO: Access modifiers changed from: private */
        @WorkerThread
        public void resume() {
            if (this.Ae) {
                connect();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        @WorkerThread
        public void zzac(Status status) {
            for (zzqj zzqjVar : this.AQ) {
                zzqjVar.zzy(status);
            }
            this.AQ.clear();
        }

        /* JADX INFO: Access modifiers changed from: private */
        @WorkerThread
        public void zzasx() {
            if (this.Ae) {
                zzatq();
                zzac(zzrh.this.xP.isGooglePlayServicesAvailable(zzrh.this.mContext) == 18 ? new Status(8, "Connection timed out while waiting for Google Play services update to complete.") : new Status(8, "API failed to connect while resuming due to an unknown error."));
                this.xB.disconnect();
            }
        }

        @WorkerThread
        private void zzatq() {
            if (this.Ae) {
                zzrh.this.mHandler.removeMessages(9, this.xx);
                zzrh.this.mHandler.removeMessages(7, this.xx);
                this.Ae = false;
            }
        }

        private void zzatr() {
            zzrh.this.mHandler.removeMessages(10, this.xx);
            zzrh.this.mHandler.sendMessageDelayed(zzrh.this.mHandler.obtainMessage(10, this.xx), zzrh.this.AI);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void zzats() {
            if (!this.xB.isConnected() || this.AU.size() != 0) {
                return;
            }
            if (this.AS.zzasi()) {
                zzatr();
            } else {
                this.xB.disconnect();
            }
        }

        @WorkerThread
        private void zzb(zzqj zzqjVar) {
            zzqjVar.zza(this.AS, zzain());
            try {
                zzqjVar.zza(this);
            } catch (DeadObjectException e) {
                onConnectionSuspended(1);
                this.xB.disconnect();
            }
        }

        @WorkerThread
        private void zzi(ConnectionResult connectionResult) {
            for (zzqn zzqnVar : this.AT) {
                zzqnVar.zza(this.xx, connectionResult);
            }
            this.AT.clear();
        }

        public Api.zze getClient() {
            return this.xB;
        }

        public int getInstanceId() {
            return this.AV;
        }

        boolean isConnected() {
            return this.xB.isConnected();
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
        @WorkerThread
        public void onConnected(@Nullable Bundle bundle) {
            zzato();
            zzi(ConnectionResult.wO);
            zzatq();
            for (zzrx zzrxVar : this.AU.values()) {
                try {
                    zzrxVar.yi.zza(this.AR, new TaskCompletionSource<>());
                } catch (DeadObjectException e) {
                    onConnectionSuspended(1);
                    this.xB.disconnect();
                }
            }
            zzatm();
            zzatr();
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener
        @WorkerThread
        public void onConnectionFailed(@NonNull ConnectionResult connectionResult) {
            zzato();
            zzrh.this.AK = -1;
            zzi(connectionResult);
            if (connectionResult.getErrorCode() == 4) {
                zzac(zzrh.AH);
            } else if (this.AQ.isEmpty()) {
                this.AW = connectionResult;
            } else {
                synchronized (zzrh.zzaox) {
                    if (zzrh.this.AN != null && zzrh.this.AO.contains(this.xx)) {
                        zzrh.this.AN.zzb(connectionResult, this.AV);
                    } else if (!zzrh.this.zzc(connectionResult, this.AV)) {
                        if (connectionResult.getErrorCode() == 18) {
                            this.Ae = true;
                        }
                        if (this.Ae) {
                            zzrh.this.mHandler.sendMessageDelayed(Message.obtain(zzrh.this.mHandler, 7, this.xx), zzrh.this.Ag);
                        } else {
                            String valueOf = String.valueOf(this.xx.zzarl());
                            zzac(new Status(17, new StringBuilder(String.valueOf(valueOf).length() + 38).append("API: ").append(valueOf).append(" is not available on this device.").toString()));
                        }
                    }
                }
            }
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
        @WorkerThread
        public void onConnectionSuspended(int i) {
            zzato();
            this.Ae = true;
            this.AS.zzask();
            zzrh.this.mHandler.sendMessageDelayed(Message.obtain(zzrh.this.mHandler, 7, this.xx), zzrh.this.Ag);
            zzrh.this.mHandler.sendMessageDelayed(Message.obtain(zzrh.this.mHandler, 9, this.xx), zzrh.this.Af);
            zzrh.this.AK = -1;
        }

        @WorkerThread
        public void signOut() {
            zzac(zzrh.AG);
            this.AS.zzasj();
            for (zzrr.zzb<?> zzbVar : this.AU.keySet()) {
                zza(new zzqj.zze(zzbVar, new TaskCompletionSource()));
            }
            this.xB.disconnect();
        }

        @Override // com.google.android.gms.internal.zzqs
        public void zza(ConnectionResult connectionResult, Api<?> api, int i) {
            onConnectionFailed(connectionResult);
        }

        @WorkerThread
        public void zza(zzqj zzqjVar) {
            if (this.xB.isConnected()) {
                zzb(zzqjVar);
                zzatr();
                return;
            }
            this.AQ.add(zzqjVar);
            if (this.AW == null || !this.AW.hasResolution()) {
                connect();
            } else {
                onConnectionFailed(this.AW);
            }
        }

        public boolean zzain() {
            return this.xB.zzain();
        }

        @WorkerThread
        public void zzatm() {
            while (this.xB.isConnected() && !this.AQ.isEmpty()) {
                zzb(this.AQ.remove());
            }
        }

        public Map<zzrr.zzb<?>, zzrx> zzatn() {
            return this.AU;
        }

        @WorkerThread
        public void zzato() {
            this.AW = null;
        }

        ConnectionResult zzatp() {
            return this.AW;
        }

        @WorkerThread
        public void zzb(zzqn zzqnVar) {
            this.AT.add(zzqnVar);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class zzb implements zze.zzf {
        private final Api.zze xB;
        private final zzql<?> xx;

        public zzb(Api.zze zzeVar, zzql<?> zzqlVar) {
            this.xB = zzeVar;
            this.xx = zzqlVar;
        }

        @Override // com.google.android.gms.common.internal.zze.zzf
        @WorkerThread
        public void zzg(@NonNull ConnectionResult connectionResult) {
            if (!connectionResult.isSuccess()) {
                ((zza) zzrh.this.zj.get(this.xx)).onConnectionFailed(connectionResult);
            } else if (this.xB.zzain()) {
            } else {
                this.xB.zza(null, Collections.emptySet());
            }
        }
    }

    private zzrh(Context context) {
        this(context, GoogleApiAvailability.getInstance());
    }

    private zzrh(Context context, GoogleApiAvailability googleApiAvailability) {
        this.Ag = 5000L;
        this.Af = 120000L;
        this.AI = 10000L;
        this.AK = -1;
        this.AL = new AtomicInteger(1);
        this.AM = new AtomicInteger(0);
        this.zj = new ConcurrentHashMap(5, 0.75f, 1);
        this.AN = null;
        this.AO = new com.google.android.gms.common.util.zza();
        this.AP = new com.google.android.gms.common.util.zza();
        this.mContext = context;
        HandlerThread handlerThread = new HandlerThread("GoogleApiHandler", 9);
        handlerThread.start();
        this.mHandler = new Handler(handlerThread.getLooper(), this);
        this.xP = googleApiAvailability;
    }

    @WorkerThread
    private void zza(int i, ConnectionResult connectionResult) {
        zza<?> zzaVar;
        Iterator<zza<?>> it = this.zj.values().iterator();
        while (true) {
            if (!it.hasNext()) {
                zzaVar = null;
                break;
            }
            zzaVar = it.next();
            if (zzaVar.getInstanceId() == i) {
                break;
            }
        }
        if (zzaVar == null) {
            Log.wtf("GoogleApiManager", new StringBuilder(76).append("Could not find API instance ").append(i).append(" while trying to fail enqueued calls.").toString(), new Exception());
            return;
        }
        String valueOf = String.valueOf(this.xP.getErrorString(connectionResult.getErrorCode()));
        String valueOf2 = String.valueOf(connectionResult.getErrorMessage());
        zzaVar.zzac(new Status(17, new StringBuilder(String.valueOf(valueOf).length() + 69 + String.valueOf(valueOf2).length()).append("Error resolution was canceled by the user, original error message: ").append(valueOf).append(": ").append(valueOf2).toString()));
    }

    @WorkerThread
    private void zza(zzrv zzrvVar) {
        zza<?> zzaVar = this.zj.get(zzrvVar.Bs.getApiKey());
        if (zzaVar == null) {
            zzb(zzrvVar.Bs);
            zzaVar = this.zj.get(zzrvVar.Bs.getApiKey());
        }
        if (!zzaVar.zzain() || this.AM.get() == zzrvVar.Br) {
            zzaVar.zza(zzrvVar.Bq);
            return;
        }
        zzrvVar.Bq.zzy(AG);
        zzaVar.signOut();
    }

    public static zzrh zzatg() {
        zzrh zzrhVar;
        synchronized (zzaox) {
            com.google.android.gms.common.internal.zzaa.zzb(AJ, "Must guarantee manager is non-null before using getInstance");
            zzrhVar = AJ;
        }
        return zzrhVar;
    }

    @WorkerThread
    private void zzati() {
        for (zza<?> zzaVar : this.zj.values()) {
            zzaVar.zzato();
            zzaVar.connect();
        }
    }

    @WorkerThread
    private void zzb(com.google.android.gms.common.api.zzc<?> zzcVar) {
        zzql<?> apiKey = zzcVar.getApiKey();
        if (!this.zj.containsKey(apiKey)) {
            this.zj.put(apiKey, new zza<>(zzcVar));
        }
        zza<?> zzaVar = this.zj.get(apiKey);
        if (zzaVar.zzain()) {
            this.AP.add(apiKey);
        }
        zzaVar.connect();
    }

    public static zzrh zzbx(Context context) {
        zzrh zzrhVar;
        synchronized (zzaox) {
            if (AJ == null) {
                AJ = new zzrh(context.getApplicationContext());
            }
            zzrhVar = AJ;
        }
        return zzrhVar;
    }

    @Override // android.os.Handler.Callback
    @WorkerThread
    public boolean handleMessage(Message message) {
        switch (message.what) {
            case 1:
                zza((zzqn) message.obj);
                break;
            case 2:
                zzati();
                break;
            case 3:
            case 6:
            case 11:
                zza((zzrv) message.obj);
                break;
            case 4:
                zza(message.arg1, (ConnectionResult) message.obj);
                break;
            case 5:
                zzb((com.google.android.gms.common.api.zzc) message.obj);
                break;
            case 7:
                if (this.zj.containsKey(message.obj)) {
                    this.zj.get(message.obj).resume();
                    break;
                }
                break;
            case 8:
                zzatj();
                break;
            case 9:
                if (this.zj.containsKey(message.obj)) {
                    this.zj.get(message.obj).zzasx();
                    break;
                }
                break;
            case 10:
                if (this.zj.containsKey(message.obj)) {
                    this.zj.get(message.obj).zzats();
                    break;
                }
                break;
            default:
                Log.w("GoogleApiManager", new StringBuilder(31).append("Unknown message id: ").append(message.what).toString());
                return false;
        }
        return true;
    }

    public <O extends Api.ApiOptions> Task<Void> zza(@NonNull com.google.android.gms.common.api.zzc<O> zzcVar, @NonNull zzrr.zzb<?> zzbVar) {
        TaskCompletionSource taskCompletionSource = new TaskCompletionSource();
        this.mHandler.sendMessage(this.mHandler.obtainMessage(11, new zzrv(new zzqj.zze(zzbVar, taskCompletionSource), this.AM.get(), zzcVar)));
        return taskCompletionSource.getTask();
    }

    public <O extends Api.ApiOptions> Task<Void> zza(@NonNull com.google.android.gms.common.api.zzc<O> zzcVar, @NonNull zzrw<Api.zzb> zzrwVar, @NonNull zzsh<Api.zzb> zzshVar) {
        TaskCompletionSource taskCompletionSource = new TaskCompletionSource();
        this.mHandler.sendMessage(this.mHandler.obtainMessage(6, new zzrv(new zzqj.zzc(new zzrx(zzrwVar, zzshVar), taskCompletionSource), this.AM.get(), zzcVar)));
        return taskCompletionSource.getTask();
    }

    /* JADX WARN: Removed duplicated region for block: B:5:0x000f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public com.google.android.gms.tasks.Task<java.lang.Void> zza(java.lang.Iterable<com.google.android.gms.common.api.zzc<?>> r5) {
        /*
            r4 = this;
            com.google.android.gms.internal.zzqn r1 = new com.google.android.gms.internal.zzqn
            r1.<init>(r5)
            java.util.Iterator r2 = r5.iterator()
        L9:
            boolean r0 = r2.hasNext()
            if (r0 == 0) goto L3a
            java.lang.Object r0 = r2.next()
            com.google.android.gms.common.api.zzc r0 = (com.google.android.gms.common.api.zzc) r0
            java.util.Map<com.google.android.gms.internal.zzql<?>, com.google.android.gms.internal.zzrh$zza<?>> r3 = r4.zj
            com.google.android.gms.internal.zzql r0 = r0.getApiKey()
            java.lang.Object r0 = r3.get(r0)
            com.google.android.gms.internal.zzrh$zza r0 = (com.google.android.gms.internal.zzrh.zza) r0
            if (r0 == 0) goto L29
            boolean r0 = r0.isConnected()
            if (r0 != 0) goto L9
        L29:
            android.os.Handler r0 = r4.mHandler
            android.os.Handler r2 = r4.mHandler
            r3 = 1
            android.os.Message r2 = r2.obtainMessage(r3, r1)
            r0.sendMessage(r2)
            com.google.android.gms.tasks.Task r0 = r1.getTask()
        L39:
            return r0
        L3a:
            r1.zzarp()
            com.google.android.gms.tasks.Task r0 = r1.getTask()
            goto L39
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.zzrh.zza(java.lang.Iterable):com.google.android.gms.tasks.Task");
    }

    public void zza(ConnectionResult connectionResult, int i) {
        if (!zzc(connectionResult, i)) {
            this.mHandler.sendMessage(this.mHandler.obtainMessage(4, i, 0, connectionResult));
        }
    }

    public void zza(com.google.android.gms.common.api.zzc<?> zzcVar) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(5, zzcVar));
    }

    public <O extends Api.ApiOptions> void zza(com.google.android.gms.common.api.zzc<O> zzcVar, int i, zzqo.zza<? extends Result, Api.zzb> zzaVar) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(3, new zzrv(new zzqj.zzb(i, zzaVar), this.AM.get(), zzcVar)));
    }

    public <O extends Api.ApiOptions, TResult> void zza(com.google.android.gms.common.api.zzc<O> zzcVar, int i, zzse<Api.zzb, TResult> zzseVar, TaskCompletionSource<TResult> taskCompletionSource, zzsb zzsbVar) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(3, new zzrv(new zzqj.zzd(i, zzseVar, taskCompletionSource, zzsbVar), this.AM.get(), zzcVar)));
    }

    @WorkerThread
    public void zza(zzqn zzqnVar) {
        for (zzql<?> zzqlVar : zzqnVar.zzaro()) {
            zza<?> zzaVar = this.zj.get(zzqlVar);
            if (zzaVar == null) {
                zzqnVar.zza(zzqlVar, new ConnectionResult(13));
                return;
            } else if (zzaVar.isConnected()) {
                zzqnVar.zza(zzqlVar, ConnectionResult.wO);
            } else if (zzaVar.zzatp() != null) {
                zzqnVar.zza(zzqlVar, zzaVar.zzatp());
            } else {
                zzaVar.zzb(zzqnVar);
            }
        }
    }

    public void zza(@NonNull zzqw zzqwVar) {
        synchronized (zzaox) {
            if (this.AN != zzqwVar) {
                this.AN = zzqwVar;
                this.AO.clear();
                this.AO.addAll(zzqwVar.zzasl());
            }
        }
    }

    public void zzarm() {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(2));
    }

    public int zzath() {
        return this.AL.getAndIncrement();
    }

    @WorkerThread
    public void zzatj() {
        for (zzql<?> zzqlVar : this.AP) {
            this.zj.remove(zzqlVar).signOut();
        }
        this.AP.clear();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzb(@NonNull zzqw zzqwVar) {
        synchronized (zzaox) {
            if (this.AN == zzqwVar) {
                this.AN = null;
                this.AO.clear();
            }
        }
    }

    boolean zzc(ConnectionResult connectionResult, int i) {
        if (connectionResult.hasResolution() || this.xP.isUserResolvableError(connectionResult.getErrorCode())) {
            this.xP.zza(this.mContext, connectionResult, i);
            return true;
        }
        return false;
    }
}
