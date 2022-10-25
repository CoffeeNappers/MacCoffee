package com.google.android.gms.internal;

import com.google.android.gms.internal.zzami;
import com.google.android.gms.internal.zzaml;
/* loaded from: classes2.dex */
public class zzaly extends zzami<zzaly> {
    private final boolean value;

    public zzaly(Boolean bool, zzaml zzamlVar) {
        super(zzamlVar);
        this.value = bool.booleanValue();
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof zzaly)) {
            return false;
        }
        zzaly zzalyVar = (zzaly) obj;
        return this.value == zzalyVar.value && this.biz.equals(zzalyVar.biz);
    }

    @Override // com.google.android.gms.internal.zzaml
    public Object getValue() {
        return Boolean.valueOf(this.value);
    }

    public int hashCode() {
        return (this.value ? 1 : 0) + this.biz.hashCode();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.zzami
    public int zza(zzaly zzalyVar) {
        if (this.value == zzalyVar.value) {
            return 0;
        }
        return this.value ? 1 : -1;
    }

    @Override // com.google.android.gms.internal.zzaml
    public String zza(zzaml.zza zzaVar) {
        String valueOf = String.valueOf(zzb(zzaVar));
        return new StringBuilder(String.valueOf(valueOf).length() + 13).append(valueOf).append("boolean:").append(this.value).toString();
    }

    @Override // com.google.android.gms.internal.zzami
    protected zzami.zza zzcyw() {
        return zzami.zza.Boolean;
    }

    @Override // com.google.android.gms.internal.zzaml
    /* renamed from: zzf */
    public zzaly zzg(zzaml zzamlVar) {
        return new zzaly(Boolean.valueOf(this.value), zzamlVar);
    }
}
