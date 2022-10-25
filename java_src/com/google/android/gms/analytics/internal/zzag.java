package com.google.android.gms.analytics.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class zzag extends BroadcastReceiver {
    static final String fx = zzag.class.getName();
    private final zzf cQ;
    private boolean fy;
    private boolean fz;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzag(zzf zzfVar) {
        com.google.android.gms.common.internal.zzaa.zzy(zzfVar);
        this.cQ = zzfVar;
    }

    private Context getContext() {
        return this.cQ.getContext();
    }

    private zzaf zzaca() {
        return this.cQ.zzaca();
    }

    private void zzagi() {
        zzaca();
        zzzg();
    }

    private zzb zzzg() {
        return this.cQ.zzzg();
    }

    public boolean isConnected() {
        if (!this.fy) {
            this.cQ.zzaca().zzev("Connectivity unknown. Receiver not registered");
        }
        return this.fz;
    }

    public boolean isRegistered() {
        return this.fy;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        zzagi();
        String action = intent.getAction();
        this.cQ.zzaca().zza("NetworkBroadcastReceiver received action", action);
        if ("android.net.conn.CONNECTIVITY_CHANGE".equals(action)) {
            boolean zzagk = zzagk();
            if (this.fz == zzagk) {
                return;
            }
            this.fz = zzagk;
            zzzg().zzaw(zzagk);
        } else if (!"com.google.analytics.RADIO_POWERED".equals(action)) {
            this.cQ.zzaca().zzd("NetworkBroadcastReceiver received unknown action", action);
        } else if (intent.hasExtra(fx)) {
        } else {
            zzzg().zzabv();
        }
    }

    public void unregister() {
        if (!isRegistered()) {
            return;
        }
        this.cQ.zzaca().zzes("Unregistering connectivity change receiver");
        this.fy = false;
        this.fz = false;
        try {
            getContext().unregisterReceiver(this);
        } catch (IllegalArgumentException e) {
            zzaca().zze("Failed to unregister the network broadcast receiver", e);
        }
    }

    public void zzagh() {
        zzagi();
        if (this.fy) {
            return;
        }
        Context context = getContext();
        context.registerReceiver(this, new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE"));
        IntentFilter intentFilter = new IntentFilter("com.google.analytics.RADIO_POWERED");
        intentFilter.addCategory(context.getPackageName());
        context.registerReceiver(this, intentFilter);
        this.fz = zzagk();
        this.cQ.zzaca().zza("Registering connectivity change receiver. Network connected", Boolean.valueOf(this.fz));
        this.fy = true;
    }

    public void zzagj() {
        if (Build.VERSION.SDK_INT <= 10) {
            return;
        }
        Context context = getContext();
        Intent intent = new Intent("com.google.analytics.RADIO_POWERED");
        intent.addCategory(context.getPackageName());
        intent.putExtra(fx, true);
        context.sendOrderedBroadcast(intent, null);
    }

    protected boolean zzagk() {
        try {
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) getContext().getSystemService("connectivity")).getActiveNetworkInfo();
            if (activeNetworkInfo != null) {
                if (activeNetworkInfo.isConnected()) {
                    return true;
                }
            }
            return false;
        } catch (SecurityException e) {
            return false;
        }
    }
}
