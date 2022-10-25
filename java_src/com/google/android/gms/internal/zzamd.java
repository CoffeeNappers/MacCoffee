package com.google.android.gms.internal;

import com.google.android.gms.internal.zzami;
import com.google.android.gms.internal.zzaml;
/* loaded from: classes2.dex */
public class zzamd extends zzami<zzamd> {
    static final /* synthetic */ boolean $assertionsDisabled;
    private final Double biP;

    static {
        $assertionsDisabled = !zzamd.class.desiredAssertionStatus();
    }

    public zzamd(Double d, zzaml zzamlVar) {
        super(zzamlVar);
        this.biP = d;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof zzamd)) {
            return false;
        }
        zzamd zzamdVar = (zzamd) obj;
        return this.biP.equals(zzamdVar.biP) && this.biz.equals(zzamdVar.biz);
    }

    @Override // com.google.android.gms.internal.zzaml
    public Object getValue() {
        return this.biP;
    }

    public int hashCode() {
        return this.biP.hashCode() + this.biz.hashCode();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.zzami
    public int zza(zzamd zzamdVar) {
        return this.biP.compareTo(zzamdVar.biP);
    }

    @Override // com.google.android.gms.internal.zzaml
    public String zza(zzaml.zza zzaVar) {
        String valueOf = String.valueOf(String.valueOf(zzb(zzaVar)).concat("number:"));
        String valueOf2 = String.valueOf(zzann.zzl(this.biP.doubleValue()));
        return valueOf2.length() != 0 ? valueOf.concat(valueOf2) : new String(valueOf);
    }

    @Override // com.google.android.gms.internal.zzami
    protected zzami.zza zzcyw() {
        return zzami.zza.Number;
    }

    @Override // com.google.android.gms.internal.zzaml
    /* renamed from: zzk */
    public zzamd zzg(zzaml zzamlVar) {
        if ($assertionsDisabled || zzamp.zzq(zzamlVar)) {
            return new zzamd(this.biP, zzamlVar);
        }
        throw new AssertionError();
    }
}
