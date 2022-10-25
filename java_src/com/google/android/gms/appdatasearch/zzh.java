package com.google.android.gms.appdatasearch;

import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzh {
    private static final String[] gB = {"text1", "text2", SettingsJsonConstants.APP_ICON_KEY, "intent_action", "intent_data", "intent_data_id", "intent_extra_data", "suggest_large_icon", "intent_activity", "thing_proto"};
    private static final Map<String, Integer> gC = new HashMap(gB.length);

    static {
        for (int i = 0; i < gB.length; i++) {
            gC.put(gB[i], Integer.valueOf(i));
        }
    }

    public static int zzahq() {
        return gB.length;
    }

    public static String zzcn(int i) {
        if (i < 0 || i >= gB.length) {
            return null;
        }
        return gB[i];
    }

    public static int zzfq(String str) {
        Integer num = gC.get(str);
        if (num == null) {
            throw new IllegalArgumentException(new StringBuilder(String.valueOf(str).length() + 44).append("[").append(str).append("] is not a valid global search section name").toString());
        }
        return num.intValue();
    }
}
