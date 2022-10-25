package com.google.android.gms.internal;

import com.google.android.gms.internal.zzgh;
import com.google.android.gms.internal.zzlw;
import java.util.Map;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public class zzcs implements zzct {
    private final zzcp zzaua;
    private final zzfe zzauc = new zzfe() { // from class: com.google.android.gms.internal.zzcs.5
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            if (!zzcs.this.zzaua.zzb(map)) {
                return;
            }
            zzcs.this.zzaua.zzb(zzmdVar, map);
        }
    };
    private final zzfe zzaud = new zzfe() { // from class: com.google.android.gms.internal.zzcs.6
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            if (!zzcs.this.zzaua.zzb(map)) {
                return;
            }
            zzcs.this.zzaua.zza(zzcs.this, map);
        }
    };
    private final zzfe zzaue = new zzfe() { // from class: com.google.android.gms.internal.zzcs.7
        @Override // com.google.android.gms.internal.zzfe
        public void zza(zzmd zzmdVar, Map<String, String> map) {
            if (!zzcs.this.zzaua.zzb(map)) {
                return;
            }
            zzcs.this.zzaua.zzc(map);
        }
    };
    private zzgh.zzc zzaug;
    private boolean zzauh;

    public zzcs(zzcp zzcpVar, zzgh zzghVar) {
        this.zzaua = zzcpVar;
        this.zzaug = zzghVar.zzny();
        this.zzaug.zza(new zzlw.zzc<zzgi>() { // from class: com.google.android.gms.internal.zzcs.1
            @Override // com.google.android.gms.internal.zzlw.zzc
            /* renamed from: zzb */
            public void zzd(zzgi zzgiVar) {
                zzcs.this.zzauh = true;
                zzcs.this.zzc(zzgiVar);
            }
        }, new zzlw.zza() { // from class: com.google.android.gms.internal.zzcs.2
            @Override // com.google.android.gms.internal.zzlw.zza
            public void run() {
                zzcs.this.zzaua.zzb(zzcs.this);
            }
        });
        String valueOf = String.valueOf(this.zzaua.zziq().zzib());
        zzkx.zzdg(valueOf.length() != 0 ? "Core JS tracking ad unit: ".concat(valueOf) : new String("Core JS tracking ad unit: "));
    }

    void zzc(zzgi zzgiVar) {
        zzgiVar.zza("/updateActiveView", this.zzauc);
        zzgiVar.zza("/untrackActiveViewUnit", this.zzaud);
        zzgiVar.zza("/visibilityChanged", this.zzaue);
    }

    @Override // com.google.android.gms.internal.zzct
    public void zzc(final JSONObject jSONObject, boolean z) {
        this.zzaug.zza(new zzlw.zzc<zzgi>() { // from class: com.google.android.gms.internal.zzcs.3
            @Override // com.google.android.gms.internal.zzlw.zzc
            /* renamed from: zzb */
            public void zzd(zzgi zzgiVar) {
                zzgiVar.zza("AFMA_updateActiveView", jSONObject);
            }
        }, new zzlw.zzb());
    }

    void zzd(zzgi zzgiVar) {
        zzgiVar.zzb("/visibilityChanged", this.zzaue);
        zzgiVar.zzb("/untrackActiveViewUnit", this.zzaud);
        zzgiVar.zzb("/updateActiveView", this.zzauc);
    }

    @Override // com.google.android.gms.internal.zzct
    public boolean zziu() {
        return this.zzauh;
    }

    @Override // com.google.android.gms.internal.zzct
    public void zziv() {
        this.zzaug.zza(new zzlw.zzc<zzgi>() { // from class: com.google.android.gms.internal.zzcs.4
            @Override // com.google.android.gms.internal.zzlw.zzc
            /* renamed from: zzb */
            public void zzd(zzgi zzgiVar) {
                zzcs.this.zzd(zzgiVar);
            }
        }, new zzlw.zzb());
        this.zzaug.release();
    }
}
