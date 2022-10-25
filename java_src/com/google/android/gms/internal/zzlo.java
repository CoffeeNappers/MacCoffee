package com.google.android.gms.internal;

import android.os.StrictMode;
import java.util.concurrent.Callable;
@zzji
/* loaded from: classes.dex */
public class zzlo {
    public static <T> T zzb(Callable<T> callable) {
        StrictMode.ThreadPolicy threadPolicy = StrictMode.getThreadPolicy();
        try {
            StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder(threadPolicy).permitDiskReads().permitDiskWrites().build());
            return callable.call();
        } catch (Throwable th) {
            try {
                zzkx.zzb("Unexpected exception.", th);
                com.google.android.gms.ads.internal.zzu.zzgq().zza(th, "StrictModeUtil.runWithLaxStrictMode");
                StrictMode.setThreadPolicy(threadPolicy);
                return null;
            } finally {
                StrictMode.setThreadPolicy(threadPolicy);
            }
        }
    }
}
