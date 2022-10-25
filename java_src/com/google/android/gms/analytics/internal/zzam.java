package com.google.android.gms.analytics.internal;

import com.google.android.gms.analytics.internal.zzq;
/* loaded from: classes.dex */
public class zzam extends zzq<zzan> {

    /* loaded from: classes.dex */
    private static class zza extends zzc implements zzq.zza<zzan> {
        private final zzan fP;

        public zza(zzf zzfVar) {
            super(zzfVar);
            this.fP = new zzan();
        }

        @Override // com.google.android.gms.analytics.internal.zzq.zza
        /* renamed from: zzahb */
        public zzan zzaee() {
            return this.fP;
        }

        @Override // com.google.android.gms.analytics.internal.zzq.zza
        public void zzd(String str, int i) {
            if ("ga_sessionTimeout".equals(str)) {
                this.fP.fR = i;
            } else {
                zzd("int configuration name not recognized", str);
            }
        }

        @Override // com.google.android.gms.analytics.internal.zzq.zza
        public void zze(String str, boolean z) {
            int i = 1;
            if ("ga_autoActivityTracking".equals(str)) {
                zzan zzanVar = this.fP;
                if (!z) {
                    i = 0;
                }
                zzanVar.fS = i;
            } else if ("ga_anonymizeIp".equals(str)) {
                zzan zzanVar2 = this.fP;
                if (!z) {
                    i = 0;
                }
                zzanVar2.fT = i;
            } else if (!"ga_reportUncaughtExceptions".equals(str)) {
                zzd("bool configuration name not recognized", str);
            } else {
                zzan zzanVar3 = this.fP;
                if (!z) {
                    i = 0;
                }
                zzanVar3.fU = i;
            }
        }

        @Override // com.google.android.gms.analytics.internal.zzq.zza
        public void zzo(String str, String str2) {
            this.fP.fV.put(str, str2);
        }

        @Override // com.google.android.gms.analytics.internal.zzq.zza
        public void zzp(String str, String str2) {
            if ("ga_trackingId".equals(str)) {
                this.fP.at = str2;
            } else if (!"ga_sampleFrequency".equals(str)) {
                zzd("string configuration name not recognized", str);
            } else {
                try {
                    this.fP.fQ = Double.parseDouble(str2);
                } catch (NumberFormatException e) {
                    zzc("Error parsing ga_sampleFrequency value", str2, e);
                }
            }
        }
    }

    public zzam(zzf zzfVar) {
        super(zzfVar, new zza(zzfVar));
    }
}
