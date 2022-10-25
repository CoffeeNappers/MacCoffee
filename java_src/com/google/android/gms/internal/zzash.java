package com.google.android.gms.internal;

import android.content.ComponentName;
import android.support.customtabs.CustomTabsClient;
import android.support.customtabs.CustomTabsServiceConnection;
import java.lang.ref.WeakReference;
/* loaded from: classes2.dex */
public class zzash extends CustomTabsServiceConnection {
    private WeakReference<zzasi> buE;

    public zzash(zzasi zzasiVar) {
        this.buE = new WeakReference<>(zzasiVar);
    }

    public void onCustomTabsServiceConnected(ComponentName componentName, CustomTabsClient customTabsClient) {
        zzasi zzasiVar = this.buE.get();
        if (zzasiVar != null) {
            zzasiVar.zza(customTabsClient);
        }
    }

    public void onServiceDisconnected(ComponentName componentName) {
        zzasi zzasiVar = this.buE.get();
        if (zzasiVar != null) {
            zzasiVar.zzmg();
        }
    }
}
