package com.google.android.gms.common.internal;

import android.annotation.TargetApi;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import com.google.android.exoplayer2.extractor.ts.TsExtractor;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class zzm extends zzl implements Handler.Callback {
    private final HashMap<zza, zzb> En = new HashMap<>();
    private final com.google.android.gms.common.stats.zza Eo = com.google.android.gms.common.stats.zza.zzaxr();
    private final long Ep = 5000;
    private final Handler mHandler;
    private final Context zzatc;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static final class zza {
        private final String Eq;
        private final ComponentName Er;
        private final String cd;

        public zza(ComponentName componentName) {
            this.cd = null;
            this.Eq = null;
            this.Er = (ComponentName) zzaa.zzy(componentName);
        }

        public zza(String str, String str2) {
            this.cd = zzaa.zzib(str);
            this.Eq = zzaa.zzib(str2);
            this.Er = null;
        }

        public boolean equals(Object obj) {
            if (this == obj) {
                return true;
            }
            if (!(obj instanceof zza)) {
                return false;
            }
            zza zzaVar = (zza) obj;
            return zzz.equal(this.cd, zzaVar.cd) && zzz.equal(this.Er, zzaVar.Er);
        }

        public int hashCode() {
            return zzz.hashCode(this.cd, this.Er);
        }

        public String toString() {
            return this.cd == null ? this.Er.flattenToString() : this.cd;
        }

        public Intent zzawe() {
            return this.cd != null ? new Intent(this.cd).setPackage(this.Eq) : new Intent().setComponent(this.Er);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public final class zzb {
        private IBinder DI;
        private ComponentName Er;
        private boolean Eu;
        private final zza Ev;
        private final zza Es = new zza();
        private final Set<ServiceConnection> Et = new HashSet();
        private int mState = 2;

        /* loaded from: classes2.dex */
        public class zza implements ServiceConnection {
            public zza() {
            }

            @Override // android.content.ServiceConnection
            public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
                synchronized (zzm.this.En) {
                    zzb.this.DI = iBinder;
                    zzb.this.Er = componentName;
                    for (ServiceConnection serviceConnection : zzb.this.Et) {
                        serviceConnection.onServiceConnected(componentName, iBinder);
                    }
                    zzb.this.mState = 1;
                }
            }

            @Override // android.content.ServiceConnection
            public void onServiceDisconnected(ComponentName componentName) {
                synchronized (zzm.this.En) {
                    zzb.this.DI = null;
                    zzb.this.Er = componentName;
                    for (ServiceConnection serviceConnection : zzb.this.Et) {
                        serviceConnection.onServiceDisconnected(componentName);
                    }
                    zzb.this.mState = 2;
                }
            }
        }

        public zzb(zza zzaVar) {
            this.Ev = zzaVar;
        }

        public IBinder getBinder() {
            return this.DI;
        }

        public ComponentName getComponentName() {
            return this.Er;
        }

        public int getState() {
            return this.mState;
        }

        public boolean isBound() {
            return this.Eu;
        }

        public void zza(ServiceConnection serviceConnection, String str) {
            zzm.this.Eo.zza(zzm.this.zzatc, serviceConnection, str, this.Ev.zzawe());
            this.Et.add(serviceConnection);
        }

        public boolean zza(ServiceConnection serviceConnection) {
            return this.Et.contains(serviceConnection);
        }

        public boolean zzawf() {
            return this.Et.isEmpty();
        }

        public void zzb(ServiceConnection serviceConnection, String str) {
            zzm.this.Eo.zzb(zzm.this.zzatc, serviceConnection);
            this.Et.remove(serviceConnection);
        }

        @TargetApi(14)
        public void zzhw(String str) {
            this.mState = 3;
            this.Eu = zzm.this.Eo.zza(zzm.this.zzatc, str, this.Ev.zzawe(), this.Es, TsExtractor.TS_STREAM_TYPE_AC3);
            if (!this.Eu) {
                this.mState = 2;
                try {
                    zzm.this.Eo.zza(zzm.this.zzatc, this.Es);
                } catch (IllegalArgumentException e) {
                }
            }
        }

        public void zzhx(String str) {
            zzm.this.Eo.zza(zzm.this.zzatc, this.Es);
            this.Eu = false;
            this.mState = 2;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzm(Context context) {
        this.zzatc = context.getApplicationContext();
        this.mHandler = new Handler(context.getMainLooper(), this);
    }

    private boolean zza(zza zzaVar, ServiceConnection serviceConnection, String str) {
        boolean isBound;
        zzaa.zzb(serviceConnection, "ServiceConnection must not be null");
        synchronized (this.En) {
            zzb zzbVar = this.En.get(zzaVar);
            if (zzbVar != null) {
                this.mHandler.removeMessages(0, zzaVar);
                if (!zzbVar.zza(serviceConnection)) {
                    zzbVar.zza(serviceConnection, str);
                    switch (zzbVar.getState()) {
                        case 1:
                            serviceConnection.onServiceConnected(zzbVar.getComponentName(), zzbVar.getBinder());
                            break;
                        case 2:
                            zzbVar.zzhw(str);
                            break;
                    }
                } else {
                    String valueOf = String.valueOf(zzaVar);
                    throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 81).append("Trying to bind a GmsServiceConnection that was already connected before.  config=").append(valueOf).toString());
                }
            } else {
                zzbVar = new zzb(zzaVar);
                zzbVar.zza(serviceConnection, str);
                zzbVar.zzhw(str);
                this.En.put(zzaVar, zzbVar);
            }
            isBound = zzbVar.isBound();
        }
        return isBound;
    }

    private void zzb(zza zzaVar, ServiceConnection serviceConnection, String str) {
        zzaa.zzb(serviceConnection, "ServiceConnection must not be null");
        synchronized (this.En) {
            zzb zzbVar = this.En.get(zzaVar);
            if (zzbVar == null) {
                String valueOf = String.valueOf(zzaVar);
                throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 50).append("Nonexistent connection status for service config: ").append(valueOf).toString());
            } else if (!zzbVar.zza(serviceConnection)) {
                String valueOf2 = String.valueOf(zzaVar);
                throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf2).length() + 76).append("Trying to unbind a GmsServiceConnection  that was not bound before.  config=").append(valueOf2).toString());
            } else {
                zzbVar.zzb(serviceConnection, str);
                if (zzbVar.zzawf()) {
                    this.mHandler.sendMessageDelayed(this.mHandler.obtainMessage(0, zzaVar), this.Ep);
                }
            }
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        switch (message.what) {
            case 0:
                zza zzaVar = (zza) message.obj;
                synchronized (this.En) {
                    zzb zzbVar = this.En.get(zzaVar);
                    if (zzbVar != null && zzbVar.zzawf()) {
                        if (zzbVar.isBound()) {
                            zzbVar.zzhx("GmsClientSupervisor");
                        }
                        this.En.remove(zzaVar);
                    }
                }
                return true;
            default:
                return false;
        }
    }

    @Override // com.google.android.gms.common.internal.zzl
    public boolean zza(ComponentName componentName, ServiceConnection serviceConnection, String str) {
        return zza(new zza(componentName), serviceConnection, str);
    }

    @Override // com.google.android.gms.common.internal.zzl
    public boolean zza(String str, String str2, ServiceConnection serviceConnection, String str3) {
        return zza(new zza(str, str2), serviceConnection, str3);
    }

    @Override // com.google.android.gms.common.internal.zzl
    public void zzb(ComponentName componentName, ServiceConnection serviceConnection, String str) {
        zzb(new zza(componentName), serviceConnection, str);
    }

    @Override // com.google.android.gms.common.internal.zzl
    public void zzb(String str, String str2, ServiceConnection serviceConnection, String str3) {
        zzb(new zza(str, str2), serviceConnection, str3);
    }
}
