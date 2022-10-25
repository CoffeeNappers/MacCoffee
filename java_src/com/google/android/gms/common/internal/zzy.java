package com.google.android.gms.common.internal;

import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.util.Log;
import com.google.android.gms.internal.zzsz;
/* loaded from: classes2.dex */
public class zzy {
    private static String EE;
    private static int EF;
    private static Object zzaox = new Object();
    private static boolean zzchk;

    public static String zzcd(Context context) {
        zzcf(context);
        return EE;
    }

    public static int zzce(Context context) {
        zzcf(context);
        return EF;
    }

    private static void zzcf(Context context) {
        Bundle bundle;
        synchronized (zzaox) {
            if (zzchk) {
                return;
            }
            zzchk = true;
            try {
                bundle = zzsz.zzco(context).getApplicationInfo(context.getPackageName(), 128).metaData;
            } catch (PackageManager.NameNotFoundException e) {
                Log.wtf("MetadataValueReader", "This should never happen.", e);
            }
            if (bundle == null) {
                return;
            }
            EE = bundle.getString("com.google.app.id");
            EF = bundle.getInt("com.google.android.gms.version");
        }
    }
}
