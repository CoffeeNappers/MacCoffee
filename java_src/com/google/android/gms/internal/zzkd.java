package com.google.android.gms.internal;
@zzji
/* loaded from: classes.dex */
public class zzkd {
    public final int errorCode;
    public final String zzbuv;
    public final long zzbwr;
    public final String zzcro;

    /* loaded from: classes2.dex */
    public static final class zza {
        private String zzbwa;
        private int zzcgw;
        private String zzcrp;
        private long zzcrq;

        public zza zzbc(int i) {
            this.zzcgw = i;
            return this;
        }

        public zza zzcr(String str) {
            this.zzbwa = str;
            return this;
        }

        public zza zzcs(String str) {
            this.zzcrp = str;
            return this;
        }

        public zza zzl(long j) {
            this.zzcrq = j;
            return this;
        }

        public zzkd zztz() {
            return new zzkd(this);
        }
    }

    private zzkd(zza zzaVar) {
        this.zzcro = zzaVar.zzbwa;
        this.zzbuv = zzaVar.zzcrp;
        this.errorCode = zzaVar.zzcgw;
        this.zzbwr = zzaVar.zzcrq;
    }
}
