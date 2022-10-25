package com.google.android.gms.internal;

import android.os.RemoteException;
/* loaded from: classes2.dex */
public abstract class zzvq<T> {
    private final int zzbcm;
    private final String zzbcn;
    private final T zzbco;

    /* loaded from: classes2.dex */
    public static class zza extends zzvq<Boolean> {
        public zza(int i, String str, Boolean bool) {
            super(i, str, bool);
        }

        @Override // com.google.android.gms.internal.zzvq
        /* renamed from: zzb */
        public Boolean zza(zzvt zzvtVar) {
            try {
                return Boolean.valueOf(zzvtVar.getBooleanFlagValue(getKey(), zzlp().booleanValue(), getSource()));
            } catch (RemoteException e) {
                return zzlp();
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class zzb extends zzvq<Integer> {
        public zzb(int i, String str, Integer num) {
            super(i, str, num);
        }

        @Override // com.google.android.gms.internal.zzvq
        /* renamed from: zzc */
        public Integer zza(zzvt zzvtVar) {
            try {
                return Integer.valueOf(zzvtVar.getIntFlagValue(getKey(), zzlp().intValue(), getSource()));
            } catch (RemoteException e) {
                return zzlp();
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class zzc extends zzvq<Long> {
        public zzc(int i, String str, Long l) {
            super(i, str, l);
        }

        @Override // com.google.android.gms.internal.zzvq
        /* renamed from: zzd */
        public Long zza(zzvt zzvtVar) {
            try {
                return Long.valueOf(zzvtVar.getLongFlagValue(getKey(), zzlp().longValue(), getSource()));
            } catch (RemoteException e) {
                return zzlp();
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class zzd extends zzvq<String> {
        public zzd(int i, String str, String str2) {
            super(i, str, str2);
        }

        @Override // com.google.android.gms.internal.zzvq
        /* renamed from: zze */
        public String zza(zzvt zzvtVar) {
            try {
                return zzvtVar.getStringFlagValue(getKey(), zzlp(), getSource());
            } catch (RemoteException e) {
                return zzlp();
            }
        }
    }

    private zzvq(int i, String str, T t) {
        this.zzbcm = i;
        this.zzbcn = str;
        this.zzbco = t;
        zzvu.zzbhe().zza(this);
    }

    public static zza zzb(int i, String str, Boolean bool) {
        return new zza(i, str, bool);
    }

    public static zzb zzb(int i, String str, int i2) {
        return new zzb(i, str, Integer.valueOf(i2));
    }

    public static zzc zzb(int i, String str, long j) {
        return new zzc(i, str, Long.valueOf(j));
    }

    public static zzd zzc(int i, String str, String str2) {
        return new zzd(i, str, str2);
    }

    public T get() {
        return (T) zzvu.zzbhf().zzb(this);
    }

    public String getKey() {
        return this.zzbcn;
    }

    public int getSource() {
        return this.zzbcm;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public abstract T zza(zzvt zzvtVar);

    public T zzlp() {
        return this.zzbco;
    }
}
