package com.vkontakte.android;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import com.vkontakte.android.data.Analytics;
import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public class PackageAddedReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        if ("android.intent.action.PACKAGE_ADDED".equals(intent.getAction())) {
            String pkg = intent.getData().getSchemeSpecificPart();
            SharedPreferences prefs = context.getSharedPreferences("pending_installs", 0);
            if (prefs.contains(pkg)) {
                String[] d = prefs.getString(pkg, null).split("~", 2);
                long time = Integer.parseInt(d[0]) * 1000;
                if (time > System.currentTimeMillis()) {
                    Analytics.track("ads/install").addParam("ad_data", d[1]).sendNow();
                }
                prefs.edit().remove(pkg).apply();
            }
            Map<String, ?> all = prefs.getAll();
            Set<String> keys = all.keySet();
            for (String k : keys) {
                long time2 = Integer.parseInt(prefs.getString(k, null).split("~", 2)[0]) * 1000;
                if (time2 < System.currentTimeMillis()) {
                    prefs.edit().remove(k).apply();
                }
            }
            if (prefs.getAll().size() == 0) {
                context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, getClass()), 2, 1);
            }
        }
    }
}
