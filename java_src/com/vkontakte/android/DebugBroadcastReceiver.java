package com.vkontakte.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.vkontakte.android.fragments.SettingsDebugFragment;
import com.vkontakte.android.navigation.Navigator;
/* loaded from: classes2.dex */
public class DebugBroadcastReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent1) {
        Intent intent = new Navigator(SettingsDebugFragment.class).intent(context);
        intent.addFlags(268435456);
        context.startActivity(intent);
    }
}
