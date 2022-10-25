package com.google.android.gms.flags.impl;

import android.content.Context;
import android.content.SharedPreferences;
import com.google.android.gms.internal.zzvv;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public class zzb {
    private static SharedPreferences WM = null;

    public static SharedPreferences zzm(final Context context) {
        SharedPreferences sharedPreferences;
        synchronized (SharedPreferences.class) {
            if (WM == null) {
                WM = (SharedPreferences) zzvv.zzb(new Callable<SharedPreferences>() { // from class: com.google.android.gms.flags.impl.zzb.1
                    @Override // java.util.concurrent.Callable
                    /* renamed from: zzbhi */
                    public SharedPreferences call() {
                        return context.getSharedPreferences("google_sdk_flags", 1);
                    }
                });
            }
            sharedPreferences = WM;
        }
        return sharedPreferences;
    }
}
