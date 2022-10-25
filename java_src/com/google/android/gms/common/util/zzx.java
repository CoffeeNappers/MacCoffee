package com.google.android.gms.common.util;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.pm.PackageManager;
import android.util.Log;
import com.google.android.gms.internal.zzsz;
/* loaded from: classes2.dex */
public final class zzx {
    @TargetApi(19)
    public static boolean zzc(Context context, int i, String str) {
        return zzsz.zzco(context).zzg(i, str);
    }

    public static boolean zzf(Context context, int i) {
        if (!zzc(context, i, "com.google.android.gms")) {
            return false;
        }
        try {
            return com.google.android.gms.common.zzf.zzbv(context).zzb(context.getPackageManager(), context.getPackageManager().getPackageInfo("com.google.android.gms", 64));
        } catch (PackageManager.NameNotFoundException e) {
            if (!Log.isLoggable("UidVerifier", 3)) {
                return false;
            }
            Log.d("UidVerifier", "Package manager can't find google play services package, defaulting to false");
            return false;
        }
    }
}
