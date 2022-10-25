package com.google.android.gms.internal;

import android.content.SharedPreferences;
@zzji
/* loaded from: classes.dex */
public abstract class zzdn<T> {
    private final int zzbcm;
    private final String zzbcn;
    private final T zzbco;

    private zzdn(int i, String str, T t) {
        this.zzbcm = i;
        this.zzbcn = str;
        this.zzbco = t;
        com.google.android.gms.ads.internal.zzu.zzgx().zza(this);
    }

    public static zzdn<String> zza(int i, String str) {
        zzdn<String> zza = zza(i, str, (String) null);
        com.google.android.gms.ads.internal.zzu.zzgx().zzb(zza);
        return zza;
    }

    public static zzdn<Float> zza(int i, String str, float f) {
        return new zzdn<Float>(i, str, Float.valueOf(f)) { // from class: com.google.android.gms.internal.zzdn.4
            @Override // com.google.android.gms.internal.zzdn
            /* renamed from: zze */
            public Float zza(SharedPreferences sharedPreferences) {
                return Float.valueOf(sharedPreferences.getFloat(getKey(), zzlp().floatValue()));
            }
        };
    }

    public static zzdn<Integer> zza(int i, String str, int i2) {
        return new zzdn<Integer>(i, str, Integer.valueOf(i2)) { // from class: com.google.android.gms.internal.zzdn.2
            @Override // com.google.android.gms.internal.zzdn
            /* renamed from: zzc */
            public Integer zza(SharedPreferences sharedPreferences) {
                return Integer.valueOf(sharedPreferences.getInt(getKey(), zzlp().intValue()));
            }
        };
    }

    public static zzdn<Long> zza(int i, String str, long j) {
        return new zzdn<Long>(i, str, Long.valueOf(j)) { // from class: com.google.android.gms.internal.zzdn.3
            @Override // com.google.android.gms.internal.zzdn
            /* renamed from: zzd */
            public Long zza(SharedPreferences sharedPreferences) {
                return Long.valueOf(sharedPreferences.getLong(getKey(), zzlp().longValue()));
            }
        };
    }

    public static zzdn<Boolean> zza(int i, String str, Boolean bool) {
        return new zzdn<Boolean>(i, str, bool) { // from class: com.google.android.gms.internal.zzdn.1
            @Override // com.google.android.gms.internal.zzdn
            /* renamed from: zzb */
            public Boolean zza(SharedPreferences sharedPreferences) {
                return Boolean.valueOf(sharedPreferences.getBoolean(getKey(), zzlp().booleanValue()));
            }
        };
    }

    public static zzdn<String> zza(int i, String str, String str2) {
        return new zzdn<String>(i, str, str2) { // from class: com.google.android.gms.internal.zzdn.5
            @Override // com.google.android.gms.internal.zzdn
            /* renamed from: zzf */
            public String zza(SharedPreferences sharedPreferences) {
                return sharedPreferences.getString(getKey(), zzlp());
            }
        };
    }

    public static zzdn<String> zzb(int i, String str) {
        zzdn<String> zza = zza(i, str, (String) null);
        com.google.android.gms.ads.internal.zzu.zzgx().zzc(zza);
        return zza;
    }

    public T get() {
        return (T) com.google.android.gms.ads.internal.zzu.zzgy().zzd(this);
    }

    public String getKey() {
        return this.zzbcn;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract T zza(SharedPreferences sharedPreferences);

    public T zzlp() {
        return this.zzbco;
    }
}
