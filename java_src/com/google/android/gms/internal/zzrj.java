package com.google.android.gms.internal;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
/* loaded from: classes2.dex */
public final class zzrj extends BroadcastReceiver {
    private final zza AZ;
    protected Context mContext;

    /* loaded from: classes2.dex */
    public static abstract class zza {
        public abstract void zzarr();
    }

    public zzrj(zza zzaVar) {
        this.AZ = zzaVar;
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Uri data = intent.getData();
        String str = null;
        if (data != null) {
            str = data.getSchemeSpecificPart();
        }
        if ("com.google.android.gms".equals(str)) {
            this.AZ.zzarr();
            unregister();
        }
    }

    public void setContext(Context context) {
        this.mContext = context;
    }

    public synchronized void unregister() {
        if (this.mContext != null) {
            this.mContext.unregisterReceiver(this);
        }
        this.mContext = null;
    }
}
