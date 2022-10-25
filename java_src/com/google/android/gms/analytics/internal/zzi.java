package com.google.android.gms.analytics.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.exoplayer2.extractor.ts.TsExtractor;
import com.google.android.gms.analytics.internal.zzac;
import java.util.Collections;
/* loaded from: classes.dex */
public class zzi extends zzd {
    private final zza dn;

    /* renamed from: do  reason: not valid java name */
    private zzac f0do;
    private final zzt dp;
    private zzal dq;

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public class zza implements ServiceConnection {
        private volatile zzac ds;
        private volatile boolean dt;

        protected zza() {
        }

        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            com.google.android.gms.common.internal.zzaa.zzhs("AnalyticsServiceConnection.onServiceConnected");
            synchronized (this) {
                if (iBinder == null) {
                    zzi.this.zzew("Service connected with null binder");
                    notifyAll();
                    return;
                }
                final zzac zzacVar = null;
                try {
                    String interfaceDescriptor = iBinder.getInterfaceDescriptor();
                    if ("com.google.android.gms.analytics.internal.IAnalyticsService".equals(interfaceDescriptor)) {
                        zzacVar = zzac.zza.zzbm(iBinder);
                        zzi.this.zzes("Bound to IAnalyticsService interface");
                    } else {
                        zzi.this.zze("Got binder with a wrong descriptor", interfaceDescriptor);
                    }
                } catch (RemoteException e) {
                    zzi.this.zzew("Service connect failed to get IAnalyticsService");
                }
                if (zzacVar == null) {
                    try {
                        com.google.android.gms.common.stats.zza.zzaxr().zza(zzi.this.getContext(), zzi.this.dn);
                    } catch (IllegalArgumentException e2) {
                    }
                } else if (!this.dt) {
                    zzi.this.zzev("onServiceConnected received after the timeout limit");
                    zzi.this.zzacc().zzg(new Runnable() { // from class: com.google.android.gms.analytics.internal.zzi.zza.1
                        @Override // java.lang.Runnable
                        public void run() {
                            if (!zzi.this.isConnected()) {
                                zzi.this.zzet("Connected to service after a timeout");
                                zzi.this.zza(zzacVar);
                            }
                        }
                    });
                } else {
                    this.ds = zzacVar;
                }
                notifyAll();
            }
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(final ComponentName componentName) {
            com.google.android.gms.common.internal.zzaa.zzhs("AnalyticsServiceConnection.onServiceDisconnected");
            zzi.this.zzacc().zzg(new Runnable() { // from class: com.google.android.gms.analytics.internal.zzi.zza.2
                @Override // java.lang.Runnable
                public void run() {
                    zzi.this.onServiceDisconnected(componentName);
                }
            });
        }

        public zzac zzacy() {
            zzac zzacVar = null;
            zzi.this.zzzx();
            Intent intent = new Intent("com.google.android.gms.analytics.service.START");
            intent.setComponent(new ComponentName("com.google.android.gms", "com.google.android.gms.analytics.service.AnalyticsService"));
            Context context = zzi.this.getContext();
            intent.putExtra("app_package_name", context.getPackageName());
            com.google.android.gms.common.stats.zza zzaxr = com.google.android.gms.common.stats.zza.zzaxr();
            synchronized (this) {
                this.ds = null;
                this.dt = true;
                boolean zza = zzaxr.zza(context, intent, zzi.this.dn, TsExtractor.TS_STREAM_TYPE_AC3);
                zzi.this.zza("Bind to service requested", Boolean.valueOf(zza));
                if (!zza) {
                    this.dt = false;
                } else {
                    try {
                        wait(zzi.this.zzacb().zzafa());
                    } catch (InterruptedException e) {
                        zzi.this.zzev("Wait for service connect was interrupted");
                    }
                    this.dt = false;
                    zzacVar = this.ds;
                    this.ds = null;
                    if (zzacVar == null) {
                        zzi.this.zzew("Successfully bound to service but never got onServiceConnected callback");
                    }
                }
            }
            return zzacVar;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzi(zzf zzfVar) {
        super(zzfVar);
        this.dq = new zzal(zzfVar.zzabz());
        this.dn = new zza();
        this.dp = new zzt(zzfVar) { // from class: com.google.android.gms.analytics.internal.zzi.1
            @Override // com.google.android.gms.analytics.internal.zzt
            public void run() {
                zzi.this.zzacx();
            }
        };
    }

    private void onDisconnect() {
        zzzg().zzabu();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onServiceDisconnected(ComponentName componentName) {
        zzzx();
        if (this.f0do != null) {
            this.f0do = null;
            zza("Disconnected from device AnalyticsService", componentName);
            onDisconnect();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(zzac zzacVar) {
        zzzx();
        this.f0do = zzacVar;
        zzacw();
        zzzg().onServiceConnected();
    }

    private void zzacw() {
        this.dq.start();
        this.dp.zzx(zzacb().zzaez());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zzacx() {
        zzzx();
        if (!isConnected()) {
            return;
        }
        zzes("Inactivity, disconnecting from device AnalyticsService");
        disconnect();
    }

    public boolean connect() {
        zzzx();
        zzacj();
        if (this.f0do != null) {
            return true;
        }
        zzac zzacy = this.dn.zzacy();
        if (zzacy == null) {
            return false;
        }
        this.f0do = zzacy;
        zzacw();
        return true;
    }

    public void disconnect() {
        zzzx();
        zzacj();
        try {
            com.google.android.gms.common.stats.zza.zzaxr().zza(getContext(), this.dn);
        } catch (IllegalArgumentException e) {
        } catch (IllegalStateException e2) {
        }
        if (this.f0do != null) {
            this.f0do = null;
            onDisconnect();
        }
    }

    public boolean isConnected() {
        zzzx();
        zzacj();
        return this.f0do != null;
    }

    public boolean zzacv() {
        zzzx();
        zzacj();
        zzac zzacVar = this.f0do;
        if (zzacVar == null) {
            return false;
        }
        try {
            zzacVar.zzabr();
            zzacw();
            return true;
        } catch (RemoteException e) {
            zzes("Failed to clear hits from AnalyticsService");
            return false;
        }
    }

    public boolean zzb(zzab zzabVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzabVar);
        zzzx();
        zzacj();
        zzac zzacVar = this.f0do;
        if (zzacVar == null) {
            return false;
        }
        try {
            zzacVar.zza(zzabVar.zzmc(), zzabVar.zzaga(), zzabVar.zzagc() ? zzacb().zzaes() : zzacb().zzaet(), Collections.emptyList());
            zzacw();
            return true;
        } catch (RemoteException e) {
            zzes("Failed to send hits to AnalyticsService");
            return false;
        }
    }

    @Override // com.google.android.gms.analytics.internal.zzd
    protected void zzzy() {
    }
}
