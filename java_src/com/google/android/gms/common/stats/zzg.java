package com.google.android.gms.common.stats;

import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.common.stats.zzb;
import com.google.android.gms.common.util.zzj;
import java.util.List;
/* loaded from: classes2.dex */
public class zzg {
    private static Boolean Go;
    private static String TAG = "WakeLockTracker";
    private static zzg Gn = new zzg();

    public static zzg zzayg() {
        return Gn;
    }

    private static boolean zzcg(Context context) {
        if (Go == null) {
            Go = Boolean.valueOf(zzch(context));
        }
        return Go.booleanValue();
    }

    private static boolean zzch(Context context) {
        try {
            if (!com.google.android.gms.common.util.zzd.zzayi()) {
                return false;
            }
            return zzb.C0057zzb.FJ.get().intValue() != zzc.LOG_LEVEL_OFF;
        } catch (SecurityException e) {
            return false;
        }
    }

    public void zza(Context context, String str, int i, String str2, String str3, String str4, int i2, List<String> list) {
        zza(context, str, i, str2, str3, str4, i2, list, 0L);
    }

    public void zza(Context context, String str, int i, String str2, String str3, String str4, int i2, List<String> list, long j) {
        if (!zzcg(context)) {
            return;
        }
        if (TextUtils.isEmpty(str)) {
            String str5 = TAG;
            String valueOf = String.valueOf(str);
            Log.e(str5, valueOf.length() != 0 ? "missing wakeLock key. ".concat(valueOf) : new String("missing wakeLock key. "));
            return;
        }
        long currentTimeMillis = System.currentTimeMillis();
        if (7 != i && 8 != i && 10 != i && 11 != i) {
            return;
        }
        try {
            context.startService(new Intent().setComponent(zzc.FP).putExtra("com.google.android.gms.common.stats.EXTRA_LOG_EVENT", new WakeLockEvent(currentTimeMillis, i, str2, i2, zze.zzz(list), str, SystemClock.elapsedRealtime(), zzj.zzck(context), str3, zze.zzih(context.getPackageName()), zzj.zzcl(context), j, str4)));
        } catch (Exception e) {
            Log.wtf(TAG, e);
        }
    }
}
