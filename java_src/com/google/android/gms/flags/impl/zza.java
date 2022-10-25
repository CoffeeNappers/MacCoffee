package com.google.android.gms.flags.impl;

import android.content.SharedPreferences;
import com.google.android.gms.internal.zzvv;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public abstract class zza<T> {

    /* renamed from: com.google.android.gms.flags.impl.zza$zza  reason: collision with other inner class name */
    /* loaded from: classes2.dex */
    public static class C0065zza extends zza<Boolean> {
        public static Boolean zza(final SharedPreferences sharedPreferences, final String str, final Boolean bool) {
            return (Boolean) zzvv.zzb(new Callable<Boolean>() { // from class: com.google.android.gms.flags.impl.zza.zza.1
                @Override // java.util.concurrent.Callable
                /* renamed from: zzwa */
                public Boolean call() {
                    return Boolean.valueOf(sharedPreferences.getBoolean(str, bool.booleanValue()));
                }
            });
        }
    }

    /* loaded from: classes2.dex */
    public static class zzb extends zza<Integer> {
        public static Integer zza(final SharedPreferences sharedPreferences, final String str, final Integer num) {
            return (Integer) zzvv.zzb(new Callable<Integer>() { // from class: com.google.android.gms.flags.impl.zza.zzb.1
                @Override // java.util.concurrent.Callable
                /* renamed from: zzbhg */
                public Integer call() {
                    return Integer.valueOf(sharedPreferences.getInt(str, num.intValue()));
                }
            });
        }
    }

    /* loaded from: classes2.dex */
    public static class zzc extends zza<Long> {
        public static Long zza(final SharedPreferences sharedPreferences, final String str, final Long l) {
            return (Long) zzvv.zzb(new Callable<Long>() { // from class: com.google.android.gms.flags.impl.zza.zzc.1
                @Override // java.util.concurrent.Callable
                /* renamed from: zzbhh */
                public Long call() {
                    return Long.valueOf(sharedPreferences.getLong(str, l.longValue()));
                }
            });
        }
    }

    /* loaded from: classes2.dex */
    public static class zzd extends zza<String> {
        public static String zza(final SharedPreferences sharedPreferences, final String str, final String str2) {
            return (String) zzvv.zzb(new Callable<String>() { // from class: com.google.android.gms.flags.impl.zza.zzd.1
                @Override // java.util.concurrent.Callable
                /* renamed from: zzaed */
                public String call() {
                    return sharedPreferences.getString(str, str2);
                }
            });
        }
    }
}
