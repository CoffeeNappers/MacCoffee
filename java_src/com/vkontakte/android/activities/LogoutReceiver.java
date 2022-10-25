package com.vkontakte.android.activities;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.support.annotation.NonNull;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.utils.L;
import java.lang.ref.WeakReference;
/* loaded from: classes2.dex */
public class LogoutReceiver extends BroadcastReceiver {
    private static final String ACTION_LOGOUT = "com.vkontakte.android.LOGOUT";
    @NonNull
    final WeakReference<Activity> activityWeakReference;

    private LogoutReceiver(Activity activity) {
        this.activityWeakReference = new WeakReference<>(activity);
    }

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Activity activity = this.activityWeakReference.get();
        if (activity == null) {
            unregister();
        } else if (ACTION_LOGOUT.equals(intent.getAction())) {
            activity.setResult(0);
            activity.finish();
        }
    }

    public void unregister() {
        try {
            VKApplication.context.unregisterReceiver(this);
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    @NonNull
    public static LogoutReceiver register(Activity activity) {
        LogoutReceiver receiver = new LogoutReceiver(activity);
        IntentFilter filter = new IntentFilter();
        filter.addAction(ACTION_LOGOUT);
        VKApplication.context.registerReceiver(receiver, filter, "com.vkontakte.android.permission.ACCESS_DATA", null);
        return receiver;
    }

    public static void sendLogout() {
        VKApplication.context.sendBroadcast(new Intent(ACTION_LOGOUT), "com.vkontakte.android.permission.ACCESS_DATA");
    }
}
