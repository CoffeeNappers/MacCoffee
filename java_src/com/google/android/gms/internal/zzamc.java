package com.google.android.gms.internal;

import com.google.android.gms.internal.zzami;
import com.google.android.gms.internal.zzaml;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzamc extends zzami<zzamc> {
    static final /* synthetic */ boolean $assertionsDisabled;
    private Map<Object, Object> biO;

    static {
        $assertionsDisabled = !zzamc.class.desiredAssertionStatus();
    }

    public zzamc(Map<Object, Object> map, zzaml zzamlVar) {
        super(zzamlVar);
        this.biO = map;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof zzamc)) {
            return false;
        }
        zzamc zzamcVar = (zzamc) obj;
        return this.biO.equals(zzamcVar.biO) && this.biz.equals(zzamcVar.biz);
    }

    @Override // com.google.android.gms.internal.zzaml
    public Object getValue() {
        return this.biO;
    }

    public int hashCode() {
        return this.biO.hashCode() + this.biz.hashCode();
    }

    @Override // com.google.android.gms.internal.zzami
    protected /* bridge */ /* synthetic */ int zza(zzamc zzamcVar) {
        return 0;
    }

    @Override // com.google.android.gms.internal.zzaml
    public String zza(zzaml.zza zzaVar) {
        String valueOf = String.valueOf(zzb(zzaVar));
        String valueOf2 = String.valueOf(this.biO);
        return new StringBuilder(String.valueOf(valueOf).length() + 14 + String.valueOf(valueOf2).length()).append(valueOf).append("deferredValue:").append(valueOf2).toString();
    }

    @Override // com.google.android.gms.internal.zzami
    protected zzami.zza zzcyw() {
        return zzami.zza.DeferredValue;
    }

    @Override // com.google.android.gms.internal.zzaml
    /* renamed from: zzj */
    public zzamc zzg(zzaml zzamlVar) {
        if ($assertionsDisabled || zzamp.zzq(zzamlVar)) {
            return new zzamc(this.biO, zzamlVar);
        }
        throw new AssertionError();
    }
}
