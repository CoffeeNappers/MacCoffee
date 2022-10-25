package com.google.android.gms.tagmanager;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
/* loaded from: classes2.dex */
class zzbt extends BroadcastReceiver {
    static final String fx = zzbt.class.getName();
    private final zzdb aFV;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzbt(zzdb zzdbVar) {
        this.aFV = zzdbVar;
    }

    public static void zzeg(Context context) {
        Intent intent = new Intent("com.google.analytics.RADIO_POWERED");
        intent.addCategory(context.getPackageName());
        intent.putExtra(fx, true);
        context.sendBroadcast(intent);
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        String action = intent.getAction();
        if (!"android.net.conn.CONNECTIVITY_CHANGE".equals(action)) {
            if (!"com.google.analytics.RADIO_POWERED".equals(action) || intent.hasExtra(fx)) {
                return;
            }
            this.aFV.zzabv();
            return;
        }
        Bundle extras = intent.getExtras();
        Boolean bool = Boolean.FALSE;
        if (extras != null) {
            bool = Boolean.valueOf(intent.getExtras().getBoolean("noConnectivity"));
        }
        this.aFV.zzco(!bool.booleanValue());
    }

    public void zzef(Context context) {
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
        context.registerReceiver(this, intentFilter);
        IntentFilter intentFilter2 = new IntentFilter();
        intentFilter2.addAction("com.google.analytics.RADIO_POWERED");
        intentFilter2.addCategory(context.getPackageName());
        context.registerReceiver(this, intentFilter2);
    }
}
