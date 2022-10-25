package ru.mail.libverify.utils;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
/* loaded from: classes3.dex */
public class NetworkStateReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if (context == null || intent == null) {
            return;
        }
        try {
            d.b("OldNetworkStateReceiver", "pass an intent to a new receiver");
            new ru.mail.libverify.utils.network.NetworkStateReceiver().onReceive(context, intent);
        } catch (Throwable th) {
            d.a("OldNetworkStateReceiver", "an error raised during an old request processing", th);
        }
    }
}
