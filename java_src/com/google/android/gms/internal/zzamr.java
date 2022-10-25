package com.google.android.gms.internal;

import com.google.android.gms.internal.zzami;
import com.google.android.gms.internal.zzaml;
/* loaded from: classes2.dex */
public class zzamr extends zzami<zzamr> {
    private final String value;

    public zzamr(String str, zzaml zzamlVar) {
        super(zzamlVar);
        this.value = str;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof zzamr)) {
            return false;
        }
        zzamr zzamrVar = (zzamr) obj;
        return this.value.equals(zzamrVar.value) && this.biz.equals(zzamrVar.biz);
    }

    @Override // com.google.android.gms.internal.zzaml
    public Object getValue() {
        return this.value;
    }

    public int hashCode() {
        return this.value.hashCode() + this.biz.hashCode();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.zzami
    public int zza(zzamr zzamrVar) {
        return this.value.compareTo(zzamrVar.value);
    }

    @Override // com.google.android.gms.internal.zzaml
    public String zza(zzaml.zza zzaVar) {
        switch (zzaVar) {
            case V1:
                String valueOf = String.valueOf(zzb(zzaVar));
                String str = this.value;
                return new StringBuilder(String.valueOf(valueOf).length() + 7 + String.valueOf(str).length()).append(valueOf).append("string:").append(str).toString();
            case V2:
                String valueOf2 = String.valueOf(zzb(zzaVar));
                String valueOf3 = String.valueOf(zzann.zztf(this.value));
                return new StringBuilder(String.valueOf(valueOf2).length() + 7 + String.valueOf(valueOf3).length()).append(valueOf2).append("string:").append(valueOf3).toString();
            default:
                String valueOf4 = String.valueOf(zzaVar);
                throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf4).length() + 38).append("Invalid hash version for string node: ").append(valueOf4).toString());
        }
    }

    @Override // com.google.android.gms.internal.zzami
    protected zzami.zza zzcyw() {
        return zzami.zza.String;
    }

    @Override // com.google.android.gms.internal.zzaml
    /* renamed from: zzs */
    public zzamr zzg(zzaml zzamlVar) {
        return new zzamr(this.value, zzamlVar);
    }
}
