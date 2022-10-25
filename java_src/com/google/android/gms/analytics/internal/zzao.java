package com.google.android.gms.analytics.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ServiceInfo;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.internal.zzmt;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
/* loaded from: classes.dex */
public class zzao {
    private static final char[] fW = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

    public static double zza(String str, double d) {
        if (str == null) {
            return d;
        }
        try {
            return Double.parseDouble(str);
        } catch (NumberFormatException e) {
            return d;
        }
    }

    public static zzmt zza(zzaf zzafVar, String str) {
        com.google.android.gms.common.internal.zzaa.zzy(zzafVar);
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        new HashMap();
        try {
            String valueOf = String.valueOf(str);
            Map<String, String> zza = com.google.android.gms.common.util.zzn.zza(new URI(valueOf.length() != 0 ? "?".concat(valueOf) : new String("?")), "UTF-8");
            zzmt zzmtVar = new zzmt();
            zzmtVar.zzdx(zza.get("utm_content"));
            zzmtVar.zzdv(zza.get("utm_medium"));
            zzmtVar.setName(zza.get("utm_campaign"));
            zzmtVar.zzdu(zza.get("utm_source"));
            zzmtVar.zzdw(zza.get("utm_term"));
            zzmtVar.zzdy(zza.get("utm_id"));
            zzmtVar.zzdz(zza.get("anid"));
            zzmtVar.zzea(zza.get("gclid"));
            zzmtVar.zzeb(zza.get("dclid"));
            zzmtVar.zzec(zza.get("aclid"));
            return zzmtVar;
        } catch (URISyntaxException e) {
            zzafVar.zzd("No valid campaign data found", e);
            return null;
        }
    }

    public static String zza(Locale locale) {
        if (locale == null) {
            return null;
        }
        String language = locale.getLanguage();
        if (TextUtils.isEmpty(language)) {
            return null;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(language.toLowerCase());
        if (!TextUtils.isEmpty(locale.getCountry())) {
            sb.append("-").append(locale.getCountry().toLowerCase());
        }
        return sb.toString();
    }

    public static void zza(Map<String, String> map, String str, Map<String, String> map2) {
        zzc(map, str, map2.get(str));
    }

    public static boolean zza(double d, String str) {
        return d > 0.0d && d < 100.0d && ((double) (zzfm(str) % 10000)) >= 100.0d * d;
    }

    public static boolean zza(Context context, String str, boolean z) {
        try {
            ActivityInfo receiverInfo = context.getPackageManager().getReceiverInfo(new ComponentName(context, str), 2);
            if (receiverInfo != null && receiverInfo.enabled) {
                if (z) {
                    if (receiverInfo.exported) {
                    }
                }
                return true;
            }
        } catch (PackageManager.NameNotFoundException e) {
        }
        return false;
    }

    public static String zzax(boolean z) {
        return z ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO;
    }

    public static void zzb(Map<String, String> map, String str, boolean z) {
        if (!map.containsKey(str)) {
            map.put(str, z ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        }
    }

    public static void zzc(Map<String, String> map, String str, String str2) {
        if (str2 == null || map.containsKey(str)) {
            return;
        }
        map.put(str, str2);
    }

    public static void zzd(Map<String, String> map, String str, String str2) {
        if (str2 == null || !TextUtils.isEmpty(map.get(str))) {
            return;
        }
        map.put(str, str2);
    }

    public static Map<String, String> zzfi(String str) {
        HashMap hashMap = new HashMap();
        for (String str2 : str.split("&")) {
            String[] split = str2.split("=", 3);
            if (split.length > 1) {
                hashMap.put(split[0], TextUtils.isEmpty(split[1]) ? null : split[1]);
                if (split.length == 3 && !TextUtils.isEmpty(split[1]) && !hashMap.containsKey(split[1])) {
                    hashMap.put(split[1], TextUtils.isEmpty(split[2]) ? null : split[2]);
                }
            } else if (split.length == 1 && split[0].length() != 0) {
                hashMap.put(split[0], null);
            }
        }
        return hashMap;
    }

    public static long zzfj(String str) {
        if (str == null) {
            return 0L;
        }
        try {
            return Long.parseLong(str);
        } catch (NumberFormatException e) {
            return 0L;
        }
    }

    public static String zzfk(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (str.contains("?")) {
            String[] split = str.split("[\\?]");
            if (split.length > 1) {
                str = split[1];
            }
        }
        if (str.contains("%3D")) {
            try {
                str = URLDecoder.decode(str, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                return null;
            }
        } else if (!str.contains("=")) {
            return null;
        }
        Map<String, String> zzfi = zzfi(str);
        String[] strArr = {"dclid", "utm_source", "gclid", "aclid", "utm_campaign", "utm_medium", "utm_term", "utm_content", "utm_id", "anid", "gmob_t"};
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 11; i++) {
            if (!TextUtils.isEmpty(zzfi.get(strArr[i]))) {
                if (sb.length() > 0) {
                    sb.append("&");
                }
                sb.append(strArr[i]).append("=").append(zzfi.get(strArr[i]));
            }
        }
        return sb.toString();
    }

    public static MessageDigest zzfl(String str) {
        MessageDigest messageDigest;
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < 2) {
                try {
                    messageDigest = MessageDigest.getInstance(str);
                } catch (NoSuchAlgorithmException e) {
                }
                if (messageDigest != null) {
                    return messageDigest;
                }
                i = i2 + 1;
            } else {
                return null;
            }
        }
    }

    public static int zzfm(String str) {
        int i = 1;
        if (!TextUtils.isEmpty(str)) {
            i = 0;
            for (int length = str.length() - 1; length >= 0; length--) {
                char charAt = str.charAt(length);
                i = ((i << 6) & 268435455) + charAt + (charAt << 14);
                int i2 = 266338304 & i;
                if (i2 != 0) {
                    i ^= i2 >> 21;
                }
            }
        }
        return i;
    }

    public static boolean zzfn(String str) {
        return TextUtils.isEmpty(str) || !str.startsWith("http:");
    }

    public static boolean zzg(String str, boolean z) {
        if (str != null) {
            if (str.equalsIgnoreCase("true") || str.equalsIgnoreCase("yes") || str.equalsIgnoreCase(AppEventsConstants.EVENT_PARAM_VALUE_YES)) {
                return true;
            }
            if (!str.equalsIgnoreCase("false") && !str.equalsIgnoreCase("no") && !str.equalsIgnoreCase(AppEventsConstants.EVENT_PARAM_VALUE_NO)) {
                return z;
            }
            return false;
        }
        return z;
    }

    public static boolean zzr(Context context, String str) {
        try {
            ServiceInfo serviceInfo = context.getPackageManager().getServiceInfo(new ComponentName(context, str), 4);
            if (serviceInfo != null) {
                if (serviceInfo.enabled) {
                    return true;
                }
            }
        } catch (PackageManager.NameNotFoundException e) {
        }
        return false;
    }
}
