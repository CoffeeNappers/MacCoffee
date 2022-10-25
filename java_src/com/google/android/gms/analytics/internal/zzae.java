package com.google.android.gms.analytics.internal;

import android.util.Log;
import com.google.android.gms.analytics.Logger;
@Deprecated
/* loaded from: classes.dex */
public class zzae {
    private static volatile Logger ft;

    static {
        setLogger(new zzs());
    }

    public static Logger getLogger() {
        return ft;
    }

    public static void setLogger(Logger logger) {
        ft = logger;
    }

    public static void v(String str) {
        zzaf zzagg = zzaf.zzagg();
        if (zzagg != null) {
            zzagg.zzes(str);
        } else if (zzbi(0)) {
            Log.v(zzy.en.get(), str);
        }
        Logger logger = ft;
        if (logger != null) {
            logger.verbose(str);
        }
    }

    public static boolean zzbi(int i) {
        return getLogger() != null && getLogger().getLogLevel() <= i;
    }

    public static void zzdh(String str) {
        zzaf zzagg = zzaf.zzagg();
        if (zzagg != null) {
            zzagg.zzeu(str);
        } else if (zzbi(1)) {
            Log.i(zzy.en.get(), str);
        }
        Logger logger = ft;
        if (logger != null) {
            logger.info(str);
        }
    }

    public static void zzdi(String str) {
        zzaf zzagg = zzaf.zzagg();
        if (zzagg != null) {
            zzagg.zzev(str);
        } else if (zzbi(2)) {
            Log.w(zzy.en.get(), str);
        }
        Logger logger = ft;
        if (logger != null) {
            logger.warn(str);
        }
    }

    public static void zzf(String str, Object obj) {
        String str2;
        zzaf zzagg = zzaf.zzagg();
        if (zzagg != null) {
            zzagg.zze(str, obj);
        } else if (zzbi(3)) {
            if (obj != null) {
                String valueOf = String.valueOf(obj);
                str2 = new StringBuilder(String.valueOf(str).length() + 1 + String.valueOf(valueOf).length()).append(str).append(":").append(valueOf).toString();
            } else {
                str2 = str;
            }
            Log.e(zzy.en.get(), str2);
        }
        Logger logger = ft;
        if (logger != null) {
            logger.error(str);
        }
    }
}
