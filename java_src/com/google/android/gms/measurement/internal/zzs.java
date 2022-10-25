package com.google.android.gms.measurement.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.annotation.MainThread;
import android.support.annotation.WorkerThread;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzs extends BroadcastReceiver {
    static final String fx = zzs.class.getName();
    private final zzx aqw;
    private boolean fy;
    private boolean fz;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzs(zzx zzxVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzxVar);
        this.aqw = zzxVar;
    }

    private Context getContext() {
        return this.aqw.getContext();
    }

    private zzq zzbwb() {
        return this.aqw.zzbwb();
    }

    @WorkerThread
    public boolean isRegistered() {
        this.aqw.zzzx();
        return this.fy;
    }

    @Override // android.content.BroadcastReceiver
    @MainThread
    public void onReceive(Context context, Intent intent) {
        this.aqw.zzacj();
        String action = intent.getAction();
        zzbwb().zzbxe().zzj("NetworkBroadcastReceiver received action", action);
        if (!"android.net.conn.CONNECTIVITY_CHANGE".equals(action)) {
            zzbwb().zzbxa().zzj("NetworkBroadcastReceiver received unknown action", action);
            return;
        }
        final boolean zzagk = this.aqw.zzbxv().zzagk();
        if (this.fz == zzagk) {
            return;
        }
        this.fz = zzagk;
        this.aqw.zzbwa().zzm(new Runnable() { // from class: com.google.android.gms.measurement.internal.zzs.1
            @Override // java.lang.Runnable
            public void run() {
                zzs.this.aqw.zzaw(zzagk);
            }
        });
    }

    @WorkerThread
    public void unregister() {
        this.aqw.zzacj();
        this.aqw.zzzx();
        if (!isRegistered()) {
            return;
        }
        zzbwb().zzbxe().log("Unregistering connectivity change receiver");
        this.fy = false;
        this.fz = false;
        try {
            getContext().unregisterReceiver(this);
        } catch (IllegalArgumentException e) {
            zzbwb().zzbwy().zzj("Failed to unregister the network broadcast receiver", e);
        }
    }

    @WorkerThread
    public void zzagh() {
        this.aqw.zzacj();
        this.aqw.zzzx();
        if (this.fy) {
            return;
        }
        getContext().registerReceiver(this, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
        this.fz = this.aqw.zzbxv().zzagk();
        zzbwb().zzbxe().zzj("Registering connectivity change receiver. Network connected", Boolean.valueOf(this.fz));
        this.fy = true;
    }
}
