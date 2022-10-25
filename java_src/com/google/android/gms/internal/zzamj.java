package com.google.android.gms.internal;

import com.google.android.gms.internal.zzami;
import com.google.android.gms.internal.zzaml;
/* loaded from: classes2.dex */
public class zzamj extends zzami<zzamj> {
    private final long value;

    public zzamj(Long l, zzaml zzamlVar) {
        super(zzamlVar);
        this.value = l.longValue();
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof zzamj)) {
            return false;
        }
        zzamj zzamjVar = (zzamj) obj;
        return this.value == zzamjVar.value && this.biz.equals(zzamjVar.biz);
    }

    @Override // com.google.android.gms.internal.zzaml
    public Object getValue() {
        return Long.valueOf(this.value);
    }

    public int hashCode() {
        return ((int) (this.value ^ (this.value >>> 32))) + this.biz.hashCode();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.zzami
    public int zza(zzamj zzamjVar) {
        return zzann.zzj(this.value, zzamjVar.value);
    }

    @Override // com.google.android.gms.internal.zzaml
    public String zza(zzaml.zza zzaVar) {
        String valueOf = String.valueOf(String.valueOf(zzb(zzaVar)).concat("number:"));
        String valueOf2 = String.valueOf(zzann.zzl(this.value));
        return valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
    }

    @Override // com.google.android.gms.internal.zzami
    protected zzami.zza zzcyw() {
        return zzami.zza.Number;
    }

    @Override // com.google.android.gms.internal.zzaml
    /* renamed from: zzp */
    public zzamj zzg(zzaml zzamlVar) {
        return new zzamj(Long.valueOf(this.value), zzamlVar);
    }
}
