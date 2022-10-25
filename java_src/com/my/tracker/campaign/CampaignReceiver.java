package com.my.tracker.campaign;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.my.tracker.a;
import com.vkontakte.android.navigation.ArgKeys;
/* loaded from: classes2.dex */
public class CampaignReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Bundle extras;
        String string;
        if (intent != null && (extras = intent.getExtras()) != null && (string = extras.getString(ArgKeys.REFERRER)) != null) {
            a.a("CampaignReceiver got referrer: " + string);
            try {
                Intent intent2 = new Intent(context, CampaignService.class);
                intent2.putExtra(ArgKeys.REFERRER, string);
                context.startService(intent2);
            } catch (Throwable th) {
                a.a(th.toString());
            }
        }
    }
}
