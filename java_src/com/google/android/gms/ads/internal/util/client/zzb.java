package com.google.android.gms.ads.internal.util.client;

import android.util.Log;
import com.google.ads.AdRequest;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class zzb {
    public static void e(String str) {
        if (zzbi(6)) {
            Log.e(AdRequest.LOGTAG, str);
        }
    }

    public static void zza(String str, Throwable th) {
        if (zzbi(3)) {
            Log.d(AdRequest.LOGTAG, str, th);
        }
    }

    public static void zzb(String str, Throwable th) {
        if (zzbi(6)) {
            Log.e(AdRequest.LOGTAG, str, th);
        }
    }

    public static boolean zzbi(int i) {
        return i >= 5 || Log.isLoggable(AdRequest.LOGTAG, i);
    }

    public static void zzc(String str, Throwable th) {
        if (zzbi(5)) {
            Log.w(AdRequest.LOGTAG, str, th);
        }
    }

    public static void zzdg(String str) {
        if (zzbi(3)) {
            Log.d(AdRequest.LOGTAG, str);
        }
    }

    public static void zzdh(String str) {
        if (zzbi(4)) {
            Log.i(AdRequest.LOGTAG, str);
        }
    }

    public static void zzdi(String str) {
        if (zzbi(5)) {
            Log.w(AdRequest.LOGTAG, str);
        }
    }
}
