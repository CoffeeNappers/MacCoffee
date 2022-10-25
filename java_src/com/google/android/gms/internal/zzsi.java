package com.google.android.gms.internal;

import android.os.Binder;
/* loaded from: classes2.dex */
public abstract class zzsi<T> {
    private T BN = null;
    protected final String zzbcn;
    protected final T zzbco;
    private static final Object zzaox = new Object();
    private static zza BL = null;
    private static int BM = 0;
    private static String READ_PERMISSION = "com.google.android.providers.gsf.permission.READ_GSERVICES";

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public interface zza {
        Long getLong(String str, Long l);

        String getString(String str, String str2);

        Boolean zza(String str, Boolean bool);

        Float zzb(String str, Float f);

        Integer zzb(String str, Integer num);
    }

    protected zzsi(String str, T t) {
        this.zzbcn = str;
        this.zzbco = t;
    }

    public static zzsi<Float> zza(String str, Float f) {
        return new zzsi<Float>(str, f) { // from class: com.google.android.gms.internal.zzsi.4
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzsi
            /* renamed from: zzhm */
            public Float zzhi(String str2) {
                return zzsi.zzauh().zzb(this.zzbcn, (Float) this.zzbco);
            }
        };
    }

    public static zzsi<Integer> zza(String str, Integer num) {
        return new zzsi<Integer>(str, num) { // from class: com.google.android.gms.internal.zzsi.3
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzsi
            /* renamed from: zzhl */
            public Integer zzhi(String str2) {
                return zzsi.zzauh().zzb(this.zzbcn, (Integer) this.zzbco);
            }
        };
    }

    public static zzsi<Long> zza(String str, Long l) {
        return new zzsi<Long>(str, l) { // from class: com.google.android.gms.internal.zzsi.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzsi
            /* renamed from: zzhk */
            public Long zzhi(String str2) {
                return zzsi.zzauh().getLong(this.zzbcn, (Long) this.zzbco);
            }
        };
    }

    public static zzsi<String> zzaa(String str, String str2) {
        return new zzsi<String>(str, str2) { // from class: com.google.android.gms.internal.zzsi.5
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzsi
            /* renamed from: zzhn */
            public String zzhi(String str3) {
                return zzsi.zzauh().getString(this.zzbcn, (String) this.zzbco);
            }
        };
    }

    static /* synthetic */ zza zzauh() {
        return null;
    }

    public static zzsi<Boolean> zzk(String str, boolean z) {
        return new zzsi<Boolean>(str, Boolean.valueOf(z)) { // from class: com.google.android.gms.internal.zzsi.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzsi
            /* renamed from: zzhj */
            public Boolean zzhi(String str2) {
                return zzsi.zzauh().zza(this.zzbcn, (Boolean) this.zzbco);
            }
        };
    }

    public final T get() {
        try {
            return zzhi(this.zzbcn);
        } catch (SecurityException e) {
            long clearCallingIdentity = Binder.clearCallingIdentity();
            try {
                return zzhi(this.zzbcn);
            } finally {
                Binder.restoreCallingIdentity(clearCallingIdentity);
            }
        }
    }

    protected abstract T zzhi(String str);
}
