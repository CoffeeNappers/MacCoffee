package com.google.android.c2dm;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
/* loaded from: classes.dex */
public class C2DMBroadcastReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        C2DMBaseReceiver.runIntentInService(context, intent);
        setResult(-1, null, null);
    }
}
