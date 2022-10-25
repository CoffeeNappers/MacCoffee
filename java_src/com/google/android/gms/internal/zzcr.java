package com.google.android.gms.internal;

import java.util.Map;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzcr implements zzct {
    private final zzcp zzaua;
    private final zzgi zzaub;
    private final zzfe zzauc = new zzfe() { // from class: com.google.android.gms.internal.zzcr.1
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            zzcr.this.zzaua.zzb(zzmdVar, map);
        }
    };
    private final zzfe zzaud = new zzfe() { // from class: com.google.android.gms.internal.zzcr.2
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            zzcr.this.zzaua.zza(zzcr.this, map);
        }
    };
    private final zzfe zzaue = new zzfe() { // from class: com.google.android.gms.internal.zzcr.3
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            zzcr.this.zzaua.zzc(map);
        }
    };

    public zzcr(zzcp zzcpVar, zzgi zzgiVar) {
        this.zzaua = zzcpVar;
        this.zzaub = zzgiVar;
        zzc(this.zzaub);
        String valueOf = String.valueOf(this.zzaua.zziq().zzib());
        zzkx.zzdg(valueOf.length() != 0 ? "Custom JS tracking ad unit: ".concat(valueOf) : new String("Custom JS tracking ad unit: "));
    }

    void zzc(zzgi zzgiVar) {
        zzgiVar.zza("/updateActiveView", this.zzauc);
        zzgiVar.zza("/untrackActiveViewUnit", this.zzaud);
        zzgiVar.zza("/visibilityChanged", this.zzaue);
    }

    @Override // com.google.android.gms.internal.zzct
    public void zzc(JSONObject jSONObject, boolean z) {
        if (!z) {
            this.zzaub.zza("AFMA_updateActiveView", jSONObject);
        } else {
            this.zzaua.zzb(this);
        }
    }

    void zzd(zzgi zzgiVar) {
        zzgiVar.zzb("/visibilityChanged", this.zzaue);
        zzgiVar.zzb("/untrackActiveViewUnit", this.zzaud);
        zzgiVar.zzb("/updateActiveView", this.zzauc);
    }

    @Override // com.google.android.gms.internal.zzct
    public boolean zziu() {
        return true;
    }

    @Override // com.google.android.gms.internal.zzct
    public void zziv() {
        zzd(this.zzaub);
    }
}
