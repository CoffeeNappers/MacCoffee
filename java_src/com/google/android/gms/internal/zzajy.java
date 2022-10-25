package com.google.android.gms.internal;

import com.google.android.gms.internal.zzama;
import java.util.HashMap;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzajy {
    private zzaml beZ = null;
    private Map<zzalz, zzajy> bfa = null;

    /* loaded from: classes2.dex */
    public interface zza {
        void zza(zzalz zzalzVar, zzajy zzajyVar);
    }

    /* loaded from: classes2.dex */
    public interface zzb {
        void zzf(zzajq zzajqVar, zzaml zzamlVar);
    }

    public void zza(final zzajq zzajqVar, final zzb zzbVar) {
        if (this.beZ != null) {
            zzbVar.zzf(zzajqVar, this.beZ);
        } else {
            zza(new zza() { // from class: com.google.android.gms.internal.zzajy.2
                @Override // com.google.android.gms.internal.zzajy.zza
                public void zza(zzalz zzalzVar, zzajy zzajyVar) {
                    zzajyVar.zza(zzajqVar.zza(zzalzVar), zzbVar);
                }
            });
        }
    }

    public void zza(zza zzaVar) {
        if (this.bfa != null) {
            for (Map.Entry<zzalz, zzajy> entry : this.bfa.entrySet()) {
                zzaVar.zza(entry.getKey(), entry.getValue());
            }
        }
    }

    public void zzh(zzajq zzajqVar, zzaml zzamlVar) {
        if (zzajqVar.isEmpty()) {
            this.beZ = zzamlVar;
            this.bfa = null;
        } else if (this.beZ != null) {
            this.beZ = this.beZ.zzl(zzajqVar, zzamlVar);
        } else {
            if (this.bfa == null) {
                this.bfa = new HashMap();
            }
            zzalz zzcvj = zzajqVar.zzcvj();
            if (!this.bfa.containsKey(zzcvj)) {
                this.bfa.put(zzcvj, new zzajy());
            }
            this.bfa.get(zzcvj).zzh(zzajqVar.zzcvk(), zzamlVar);
        }
    }

    public boolean zzr(final zzajq zzajqVar) {
        if (zzajqVar.isEmpty()) {
            this.beZ = null;
            this.bfa = null;
            return true;
        } else if (this.beZ != null) {
            if (this.beZ.zzcze()) {
                return false;
            }
            this.beZ = null;
            ((zzama) this.beZ).zza(new zzama.zza() { // from class: com.google.android.gms.internal.zzajy.1
                @Override // com.google.android.gms.internal.zzama.zza
                public void zzb(zzalz zzalzVar, zzaml zzamlVar) {
                    zzajy.this.zzh(zzajqVar.zza(zzalzVar), zzamlVar);
                }
            });
            return zzr(zzajqVar);
        } else if (this.bfa == null) {
            return true;
        } else {
            zzalz zzcvj = zzajqVar.zzcvj();
            zzajq zzcvk = zzajqVar.zzcvk();
            if (this.bfa.containsKey(zzcvj) && this.bfa.get(zzcvj).zzr(zzcvk)) {
                this.bfa.remove(zzcvj);
            }
            if (!this.bfa.isEmpty()) {
                return false;
            }
            this.bfa = null;
            return true;
        }
    }
}
