package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.support.annotation.NonNull;
import android.support.v4.app.FragmentActivity;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.internal.zzk;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.internal.zzrj;
import com.google.android.gms.internal.zzrm;
import com.google.android.gms.internal.zzsg;
import java.io.FileDescriptor;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.Lock;
/* loaded from: classes2.dex */
public final class zzrd extends GoogleApiClient implements zzrm.zza {
    private final com.google.android.gms.common.internal.zzk Ab;
    private volatile boolean Ae;
    private final zza Ah;
    zzrj Ai;
    final Map<Api.zzc<?>, Api.zze> Aj;
    private final ArrayList<zzqr> Am;
    private Integer An;
    final zzsg Ap;
    private final Context mContext;
    private final int xN;
    private final GoogleApiAvailability xP;
    final Api.zza<? extends zzxp, zzxq> xQ;
    private boolean xT;
    final com.google.android.gms.common.internal.zzf zP;
    private final Lock zg;
    final Map<Api<?>, Integer> zk;
    private final Looper zzajy;
    private zzrm Ac = null;
    final Queue<zzqo.zza<?, ?>> Ad = new LinkedList();
    private long Af = 120000;
    private long Ag = 5000;
    Set<Scope> Ak = new HashSet();
    private final zzrs Al = new zzrs();
    Set<zzsf> Ao = null;
    private final zzk.zza Aq = new zzk.zza() { // from class: com.google.android.gms.internal.zzrd.1
        @Override // com.google.android.gms.common.internal.zzk.zza
        public boolean isConnected() {
            return zzrd.this.isConnected();
        }

        @Override // com.google.android.gms.common.internal.zzk.zza
        public Bundle zzapn() {
            return null;
        }
    };

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public final class zza extends Handler {
        zza(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            switch (message.what) {
                case 1:
                    zzrd.this.zzasx();
                    return;
                case 2:
                    zzrd.this.resume();
                    return;
                default:
                    Log.w("GoogleApiClientImpl", new StringBuilder(31).append("Unknown message id: ").append(message.what).toString());
                    return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zzb extends zzrj.zza {
        private WeakReference<zzrd> Av;

        zzb(zzrd zzrdVar) {
            this.Av = new WeakReference<>(zzrdVar);
        }

        @Override // com.google.android.gms.internal.zzrj.zza
        public void zzarr() {
            zzrd zzrdVar = this.Av.get();
            if (zzrdVar == null) {
                return;
            }
            zzrdVar.resume();
        }
    }

    public zzrd(Context context, Lock lock, Looper looper, com.google.android.gms.common.internal.zzf zzfVar, GoogleApiAvailability googleApiAvailability, Api.zza<? extends zzxp, zzxq> zzaVar, Map<Api<?>, Integer> map, List<GoogleApiClient.ConnectionCallbacks> list, List<GoogleApiClient.OnConnectionFailedListener> list2, Map<Api.zzc<?>, Api.zze> map2, int i, int i2, ArrayList<zzqr> arrayList, boolean z) {
        this.An = null;
        this.mContext = context;
        this.zg = lock;
        this.xT = z;
        this.Ab = new com.google.android.gms.common.internal.zzk(looper, this.Aq);
        this.zzajy = looper;
        this.Ah = new zza(looper);
        this.xP = googleApiAvailability;
        this.xN = i;
        if (this.xN >= 0) {
            this.An = Integer.valueOf(i2);
        }
        this.zk = map;
        this.Aj = map2;
        this.Am = arrayList;
        this.Ap = new zzsg(this.Aj);
        for (GoogleApiClient.ConnectionCallbacks connectionCallbacks : list) {
            this.Ab.registerConnectionCallbacks(connectionCallbacks);
        }
        for (GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener : list2) {
            this.Ab.registerConnectionFailedListener(onConnectionFailedListener);
        }
        this.zP = zzfVar;
        this.xQ = zzaVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void resume() {
        this.zg.lock();
        try {
            if (isResuming()) {
                zzasw();
            }
        } finally {
            this.zg.unlock();
        }
    }

    public static int zza(Iterable<Api.zze> iterable, boolean z) {
        boolean z2 = false;
        boolean z3 = false;
        for (Api.zze zzeVar : iterable) {
            if (zzeVar.zzain()) {
                z3 = true;
            }
            z2 = zzeVar.zzajc() ? true : z2;
        }
        if (z3) {
            return (!z2 || !z) ? 1 : 2;
        }
        return 3;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(final GoogleApiClient googleApiClient, final zzsc zzscVar, final boolean z) {
        zzsn.EU.zzg(googleApiClient).setResultCallback(new ResultCallback<Status>() { // from class: com.google.android.gms.internal.zzrd.4
            @Override // com.google.android.gms.common.api.ResultCallback
            /* renamed from: zzp */
            public void onResult(@NonNull Status status) {
                com.google.android.gms.auth.api.signin.internal.zzk.zzba(zzrd.this.mContext).zzajo();
                if (status.isSuccess() && zzrd.this.isConnected()) {
                    zzrd.this.reconnect();
                }
                zzscVar.zzc((zzsc) status);
                if (z) {
                    googleApiClient.disconnect();
                }
            }
        });
    }

    private void zzasw() {
        this.Ab.zzawd();
        this.Ac.connect();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzasx() {
        this.zg.lock();
        try {
            if (zzasz()) {
                zzasw();
            }
        } finally {
            this.zg.unlock();
        }
    }

    private void zzb(@NonNull zzrn zzrnVar) {
        if (this.xN >= 0) {
            zzqm.zza(zzrnVar).zzfs(this.xN);
            return;
        }
        throw new IllegalStateException("Called stopAutoManage but automatic lifecycle management is not enabled.");
    }

    private void zzfv(int i) {
        if (this.An == null) {
            this.An = Integer.valueOf(i);
        } else if (this.An.intValue() != i) {
            String valueOf = String.valueOf(zzfw(i));
            String valueOf2 = String.valueOf(zzfw(this.An.intValue()));
            throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 51 + String.valueOf(valueOf2).length()).append("Cannot use sign-in mode: ").append(valueOf).append(". Mode was already set to ").append(valueOf2).toString());
        }
        if (this.Ac != null) {
            return;
        }
        boolean z = false;
        boolean z2 = false;
        for (Api.zze zzeVar : this.Aj.values()) {
            if (zzeVar.zzain()) {
                z2 = true;
            }
            z = zzeVar.zzajc() ? true : z;
        }
        switch (this.An.intValue()) {
            case 1:
                if (!z2) {
                    throw new IllegalStateException("SIGN_IN_MODE_REQUIRED cannot be used on a GoogleApiClient that does not contain any authenticated APIs. Use connect() instead.");
                }
                if (z) {
                    throw new IllegalStateException("Cannot use SIGN_IN_MODE_REQUIRED with GOOGLE_SIGN_IN_API. Use connect(SIGN_IN_MODE_OPTIONAL) instead.");
                }
                break;
            case 2:
                if (z2) {
                    this.Ac = zzqt.zza(this.mContext, this, this.zg, this.zzajy, this.xP, this.Aj, this.zP, this.zk, this.xQ, this.Am);
                    return;
                }
                break;
        }
        if (!this.xT || z2 || z) {
            this.Ac = new zzrf(this.mContext, this, this.zg, this.zzajy, this.xP, this.Aj, this.zP, this.zk, this.xQ, this.Am, this);
        } else {
            this.Ac = new zzqu(this.mContext, this.zg, this.zzajy, this.xP, this.Aj, this.zk, this.Am, this);
        }
    }

    static String zzfw(int i) {
        switch (i) {
            case 1:
                return "SIGN_IN_MODE_REQUIRED";
            case 2:
                return "SIGN_IN_MODE_OPTIONAL";
            case 3:
                return "SIGN_IN_MODE_NONE";
            default:
                return "UNKNOWN";
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public ConnectionResult blockingConnect() {
        boolean z = true;
        com.google.android.gms.common.internal.zzaa.zza(Looper.myLooper() != Looper.getMainLooper(), "blockingConnect must not be called on the UI thread");
        this.zg.lock();
        try {
            if (this.xN >= 0) {
                if (this.An == null) {
                    z = false;
                }
                com.google.android.gms.common.internal.zzaa.zza(z, "Sign-in mode should have been set explicitly by auto-manage.");
            } else if (this.An == null) {
                this.An = Integer.valueOf(zza(this.Aj.values(), false));
            } else if (this.An.intValue() == 2) {
                throw new IllegalStateException("Cannot call blockingConnect() when sign-in mode is set to SIGN_IN_MODE_OPTIONAL. Call connect(SIGN_IN_MODE_OPTIONAL) instead.");
            }
            zzfv(this.An.intValue());
            this.Ab.zzawd();
            return this.Ac.blockingConnect();
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public ConnectionResult blockingConnect(long j, @NonNull TimeUnit timeUnit) {
        boolean z = false;
        if (Looper.myLooper() != Looper.getMainLooper()) {
            z = true;
        }
        com.google.android.gms.common.internal.zzaa.zza(z, "blockingConnect must not be called on the UI thread");
        com.google.android.gms.common.internal.zzaa.zzb(timeUnit, "TimeUnit must not be null");
        this.zg.lock();
        try {
            if (this.An == null) {
                this.An = Integer.valueOf(zza(this.Aj.values(), false));
            } else if (this.An.intValue() == 2) {
                throw new IllegalStateException("Cannot call blockingConnect() when sign-in mode is set to SIGN_IN_MODE_OPTIONAL. Call connect(SIGN_IN_MODE_OPTIONAL) instead.");
            }
            zzfv(this.An.intValue());
            this.Ab.zzawd();
            return this.Ac.blockingConnect(j, timeUnit);
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public PendingResult<Status> clearDefaultAccountAndReconnect() {
        com.google.android.gms.common.internal.zzaa.zza(isConnected(), "GoogleApiClient is not connected yet.");
        com.google.android.gms.common.internal.zzaa.zza(this.An.intValue() != 2, "Cannot use clearDefaultAccountAndReconnect with GOOGLE_SIGN_IN_API");
        final zzsc zzscVar = new zzsc(this);
        if (this.Aj.containsKey(zzsn.hg)) {
            zza(this, zzscVar, false);
        } else {
            final AtomicReference atomicReference = new AtomicReference();
            GoogleApiClient build = new GoogleApiClient.Builder(this.mContext).addApi(zzsn.API).addConnectionCallbacks(new GoogleApiClient.ConnectionCallbacks() { // from class: com.google.android.gms.internal.zzrd.2
                @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
                public void onConnected(Bundle bundle) {
                    zzrd.this.zza((GoogleApiClient) atomicReference.get(), zzscVar, true);
                }

                @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
                public void onConnectionSuspended(int i) {
                }
            }).addOnConnectionFailedListener(new GoogleApiClient.OnConnectionFailedListener() { // from class: com.google.android.gms.internal.zzrd.3
                @Override // com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener
                public void onConnectionFailed(@NonNull ConnectionResult connectionResult) {
                    zzscVar.zzc((zzsc) new Status(8));
                }
            }).setHandler(this.Ah).build();
            atomicReference.set(build);
            build.connect();
        }
        return zzscVar;
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void connect() {
        boolean z = false;
        this.zg.lock();
        try {
            if (this.xN >= 0) {
                if (this.An != null) {
                    z = true;
                }
                com.google.android.gms.common.internal.zzaa.zza(z, "Sign-in mode should have been set explicitly by auto-manage.");
            } else if (this.An == null) {
                this.An = Integer.valueOf(zza(this.Aj.values(), false));
            } else if (this.An.intValue() == 2) {
                throw new IllegalStateException("Cannot call connect() when SignInMode is set to SIGN_IN_MODE_OPTIONAL. Call connect(SIGN_IN_MODE_OPTIONAL) instead.");
            }
            connect(this.An.intValue());
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void connect(int i) {
        boolean z = true;
        this.zg.lock();
        if (i != 3 && i != 1 && i != 2) {
            z = false;
        }
        try {
            com.google.android.gms.common.internal.zzaa.zzb(z, new StringBuilder(33).append("Illegal sign-in mode: ").append(i).toString());
            zzfv(i);
            zzasw();
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void disconnect() {
        this.zg.lock();
        try {
            this.Ap.release();
            if (this.Ac != null) {
                this.Ac.disconnect();
            }
            this.Al.release();
            for (zzqo.zza<?, ?> zzaVar : this.Ad) {
                zzaVar.zza((zzsg.zzb) null);
                zzaVar.cancel();
            }
            this.Ad.clear();
            if (this.Ac == null) {
                return;
            }
            zzasz();
            this.Ab.zzawc();
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void dump(String str, FileDescriptor fileDescriptor, PrintWriter printWriter, String[] strArr) {
        printWriter.append((CharSequence) str).append("mContext=").println(this.mContext);
        printWriter.append((CharSequence) str).append("mResuming=").print(this.Ae);
        printWriter.append(" mWorkQueue.size()=").print(this.Ad.size());
        this.Ap.dump(printWriter);
        if (this.Ac != null) {
            this.Ac.dump(str, fileDescriptor, printWriter, strArr);
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    @NonNull
    public ConnectionResult getConnectionResult(@NonNull Api<?> api) {
        this.zg.lock();
        try {
            if (!isConnected() && !isResuming()) {
                throw new IllegalStateException("Cannot invoke getConnectionResult unless GoogleApiClient is connected");
            }
            if (!this.Aj.containsKey(api.zzaqv())) {
                throw new IllegalArgumentException(String.valueOf(api.getName()).concat(" was never registered with GoogleApiClient"));
            }
            ConnectionResult connectionResult = this.Ac.getConnectionResult(api);
            if (connectionResult == null) {
                if (isResuming()) {
                    connectionResult = ConnectionResult.wO;
                } else {
                    Log.w("GoogleApiClientImpl", zzatb());
                    Log.wtf("GoogleApiClientImpl", String.valueOf(api.getName()).concat(" requested in getConnectionResult is not connected but is not present in the failed  connections map"), new Exception());
                    connectionResult = new ConnectionResult(8, null);
                }
            }
            return connectionResult;
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public Context getContext() {
        return this.mContext;
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public Looper getLooper() {
        return this.zzajy;
    }

    public int getSessionId() {
        return System.identityHashCode(this);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public boolean hasConnectedApi(@NonNull Api<?> api) {
        if (!isConnected()) {
            return false;
        }
        Api.zze zzeVar = this.Aj.get(api.zzaqv());
        return zzeVar != null && zzeVar.isConnected();
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public boolean isConnected() {
        return this.Ac != null && this.Ac.isConnected();
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public boolean isConnecting() {
        return this.Ac != null && this.Ac.isConnecting();
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public boolean isConnectionCallbacksRegistered(@NonNull GoogleApiClient.ConnectionCallbacks connectionCallbacks) {
        return this.Ab.isConnectionCallbacksRegistered(connectionCallbacks);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public boolean isConnectionFailedListenerRegistered(@NonNull GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        return this.Ab.isConnectionFailedListenerRegistered(onConnectionFailedListener);
    }

    boolean isResuming() {
        return this.Ae;
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void reconnect() {
        disconnect();
        connect();
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void registerConnectionCallbacks(@NonNull GoogleApiClient.ConnectionCallbacks connectionCallbacks) {
        this.Ab.registerConnectionCallbacks(connectionCallbacks);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void registerConnectionFailedListener(@NonNull GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        this.Ab.registerConnectionFailedListener(onConnectionFailedListener);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void stopAutoManage(@NonNull FragmentActivity fragmentActivity) {
        zzb(new zzrn(fragmentActivity));
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void unregisterConnectionCallbacks(@NonNull GoogleApiClient.ConnectionCallbacks connectionCallbacks) {
        this.Ab.unregisterConnectionCallbacks(connectionCallbacks);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void unregisterConnectionFailedListener(@NonNull GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        this.Ab.unregisterConnectionFailedListener(onConnectionFailedListener);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    @NonNull
    public <C extends Api.zze> C zza(@NonNull Api.zzc<C> zzcVar) {
        C c = (C) this.Aj.get(zzcVar);
        com.google.android.gms.common.internal.zzaa.zzb(c, "Appropriate Api was not requested.");
        return c;
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public <A extends Api.zzb, R extends Result, T extends zzqo.zza<R, A>> T zza(@NonNull T t) {
        com.google.android.gms.common.internal.zzaa.zzb(t.zzaqv() != null, "This task can not be enqueued (it's probably a Batch or malformed)");
        boolean containsKey = this.Aj.containsKey(t.zzaqv());
        String name = t.getApi() != null ? t.getApi().getName() : "the API";
        com.google.android.gms.common.internal.zzaa.zzb(containsKey, new StringBuilder(String.valueOf(name).length() + 65).append("GoogleApiClient is not configured to use ").append(name).append(" required for this call.").toString());
        this.zg.lock();
        try {
            if (this.Ac == null) {
                this.Ad.add(t);
            } else {
                t = (T) this.Ac.zza((zzrm) t);
            }
            return t;
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void zza(zzsf zzsfVar) {
        this.zg.lock();
        try {
            if (this.Ao == null) {
                this.Ao = new HashSet();
            }
            this.Ao.add(zzsfVar);
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public boolean zza(@NonNull Api<?> api) {
        return this.Aj.containsKey(api.zzaqv());
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public boolean zza(zzsa zzsaVar) {
        return this.Ac != null && this.Ac.zza(zzsaVar);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void zzard() {
        if (this.Ac != null) {
            this.Ac.zzard();
        }
    }

    void zzasy() {
        if (isResuming()) {
            return;
        }
        this.Ae = true;
        if (this.Ai == null) {
            this.Ai = this.xP.zza(this.mContext.getApplicationContext(), new zzb(this));
        }
        this.Ah.sendMessageDelayed(this.Ah.obtainMessage(1), this.Af);
        this.Ah.sendMessageDelayed(this.Ah.obtainMessage(2), this.Ag);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzasz() {
        if (!isResuming()) {
            return false;
        }
        this.Ae = false;
        this.Ah.removeMessages(2);
        this.Ah.removeMessages(1);
        if (this.Ai != null) {
            this.Ai.unregister();
            this.Ai = null;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzata() {
        boolean z = false;
        this.zg.lock();
        try {
            if (this.Ao != null) {
                if (!this.Ao.isEmpty()) {
                    z = true;
                }
            }
            return z;
        } finally {
            this.zg.unlock();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String zzatb() {
        StringWriter stringWriter = new StringWriter();
        dump("", null, new PrintWriter(stringWriter), null);
        return stringWriter.toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <C extends Api.zze> C zzb(Api.zzc<?> zzcVar) {
        C c = (C) this.Aj.get(zzcVar);
        com.google.android.gms.common.internal.zzaa.zzb(c, "Appropriate Api was not requested.");
        return c;
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public <A extends Api.zzb, T extends zzqo.zza<? extends Result, A>> T zzb(@NonNull T t) {
        com.google.android.gms.common.internal.zzaa.zzb(t.zzaqv() != null, "This task can not be executed (it's probably a Batch or malformed)");
        boolean containsKey = this.Aj.containsKey(t.zzaqv());
        String name = t.getApi() != null ? t.getApi().getName() : "the API";
        com.google.android.gms.common.internal.zzaa.zzb(containsKey, new StringBuilder(String.valueOf(name).length() + 65).append("GoogleApiClient is not configured to use ").append(name).append(" required for this call.").toString());
        this.zg.lock();
        try {
            if (this.Ac == null) {
                throw new IllegalStateException("GoogleApiClient is not connected yet.");
            }
            if (isResuming()) {
                this.Ad.add(t);
                while (!this.Ad.isEmpty()) {
                    zzqo.zza<?, ?> remove = this.Ad.remove();
                    this.Ap.zzb(remove);
                    remove.zzaa(Status.yb);
                }
            } else {
                t = (T) this.Ac.zzb(t);
            }
            return t;
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public void zzb(zzsf zzsfVar) {
        this.zg.lock();
        try {
            if (this.Ao == null) {
                Log.wtf("GoogleApiClientImpl", "Attempted to remove pending transform when no transforms are registered.", new Exception());
            } else if (!this.Ao.remove(zzsfVar)) {
                Log.wtf("GoogleApiClientImpl", "Failed to remove pending transform - this may lead to memory leaks!", new Exception());
            } else if (!zzata()) {
                this.Ac.zzarz();
            }
        } finally {
            this.zg.unlock();
        }
    }

    @Override // com.google.android.gms.internal.zzrm.zza
    public void zzc(int i, boolean z) {
        if (i == 1 && !z) {
            zzasy();
        }
        this.Ap.zzauf();
        this.Ab.zzgn(i);
        this.Ab.zzawc();
        if (i == 2) {
            zzasw();
        }
    }

    @Override // com.google.android.gms.internal.zzrm.zza
    public void zzc(ConnectionResult connectionResult) {
        if (!this.xP.zzd(this.mContext, connectionResult.getErrorCode())) {
            zzasz();
        }
        if (!isResuming()) {
            this.Ab.zzn(connectionResult);
            this.Ab.zzawc();
        }
    }

    @Override // com.google.android.gms.internal.zzrm.zza
    public void zzn(Bundle bundle) {
        while (!this.Ad.isEmpty()) {
            zzb((zzrd) this.Ad.remove());
        }
        this.Ab.zzp(bundle);
    }

    @Override // com.google.android.gms.common.api.GoogleApiClient
    public <L> zzrr<L> zzs(@NonNull L l) {
        this.zg.lock();
        try {
            return this.Al.zzb(l, this.zzajy);
        } finally {
            this.zg.unlock();
        }
    }
}
