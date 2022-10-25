package com.google.android.gms.tagmanager;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzbf {
    private static String aFA;
    static Map<String, String> aFB = new HashMap();

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zzaf(Context context, String str) {
        zzdd.zzc(context, "gtm_install_referrer", ArgKeys.REFERRER, str);
        zzah(context, str);
    }

    public static String zzag(Context context, String str) {
        if (aFA == null) {
            synchronized (zzbf.class) {
                if (aFA == null) {
                    SharedPreferences sharedPreferences = context.getSharedPreferences("gtm_install_referrer", 0);
                    if (sharedPreferences != null) {
                        aFA = sharedPreferences.getString(ArgKeys.REFERRER, "");
                    } else {
                        aFA = "";
                    }
                }
            }
        }
        return zzbg(aFA, str);
    }

    public static void zzah(Context context, String str) {
        String zzbg = zzbg(str, "conv");
        if (zzbg == null || zzbg.length() <= 0) {
            return;
        }
        aFB.put(zzbg, str);
        zzdd.zzc(context, "gtm_click_referrers", zzbg, str);
    }

    public static String zzbg(String str, String str2) {
        if (str2 != null) {
            String valueOf = String.valueOf(str);
            return Uri.parse(valueOf.length() != 0 ? "http://hostname/?".concat(valueOf) : new String("http://hostname/?")).getQueryParameter(str2);
        } else if (str.length() <= 0) {
            return null;
        } else {
            return str;
        }
    }

    public static String zzj(Context context, String str, String str2) {
        String str3 = aFB.get(str);
        if (str3 == null) {
            SharedPreferences sharedPreferences = context.getSharedPreferences("gtm_click_referrers", 0);
            str3 = sharedPreferences != null ? sharedPreferences.getString(str, "") : "";
            aFB.put(str, str3);
        }
        return zzbg(str3, str2);
    }

    public static void zzpl(String str) {
        synchronized (zzbf.class) {
            aFA = str;
        }
    }
}
