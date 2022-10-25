package com.google.android.gms.analytics.internal;

import com.google.android.gms.analytics.internal.zzq;
/* loaded from: classes2.dex */
public class zzz extends zzq<zzaa> {

    /* loaded from: classes2.dex */
    private static class zza implements zzq.zza<zzaa> {
        private final zzf cQ;
        private final zzaa fe = new zzaa();

        public zza(zzf zzfVar) {
            this.cQ = zzfVar;
        }

        @Override // com.google.android.gms.analytics.internal.zzq.zza
        /* renamed from: zzafp */
        public zzaa zzaee() {
            return this.fe;
        }

        @Override // com.google.android.gms.analytics.internal.zzq.zza
        public void zzd(String str, int i) {
            if ("ga_dispatchPeriod".equals(str)) {
                this.fe.fg = i;
            } else {
                this.cQ.zzaca().zzd("Int xml configuration name not recognized", str);
            }
        }

        @Override // com.google.android.gms.analytics.internal.zzq.zza
        public void zze(String str, boolean z) {
            if (!"ga_dryRun".equals(str)) {
                this.cQ.zzaca().zzd("Bool xml configuration name not recognized", str);
                return;
            }
            this.fe.fh = z ? 1 : 0;
        }

        @Override // com.google.android.gms.analytics.internal.zzq.zza
        public void zzo(String str, String str2) {
        }

        @Override // com.google.android.gms.analytics.internal.zzq.zza
        public void zzp(String str, String str2) {
            if ("ga_appName".equals(str)) {
                this.fe.bN = str2;
            } else if ("ga_appVersion".equals(str)) {
                this.fe.bO = str2;
            } else if ("ga_logLevel".equals(str)) {
                this.fe.ff = str2;
            } else {
                this.cQ.zzaca().zzd("String xml configuration name not recognized", str);
            }
        }
    }

    public zzz(zzf zzfVar) {
        super(zzfVar, new zza(zzfVar));
    }
}
