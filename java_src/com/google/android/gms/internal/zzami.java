package com.google.android.gms.internal;

import com.google.android.gms.internal.zzami;
import com.google.android.gms.internal.zzaml;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
/* loaded from: classes2.dex */
public abstract class zzami<T extends zzami> implements zzaml {
    static final /* synthetic */ boolean $assertionsDisabled;
    private String biA;
    protected final zzaml biz;

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes2.dex */
    public enum zza {
        DeferredValue,
        Boolean,
        Number,
        String
    }

    static {
        $assertionsDisabled = !zzami.class.desiredAssertionStatus();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzami(zzaml zzamlVar) {
        this.biz = zzamlVar;
    }

    private static int zza(zzamj zzamjVar, zzamd zzamdVar) {
        return Double.valueOf(((Long) zzamjVar.getValue()).longValue()).compareTo((Double) zzamdVar.getValue());
    }

    @Override // com.google.android.gms.internal.zzaml
    public int getChildCount() {
        return 0;
    }

    @Override // com.google.android.gms.internal.zzaml
    public Object getValue(boolean z) {
        if (!z || this.biz.isEmpty()) {
            return getValue();
        }
        HashMap hashMap = new HashMap();
        hashMap.put(".value", getValue());
        hashMap.put(".priority", this.biz.getValue());
        return hashMap;
    }

    @Override // com.google.android.gms.internal.zzaml
    public boolean isEmpty() {
        return false;
    }

    @Override // java.lang.Iterable
    public Iterator<zzamk> iterator() {
        return Collections.emptyList().iterator();
    }

    public String toString() {
        String obj = getValue(true).toString();
        return obj.length() <= 100 ? obj : String.valueOf(obj.substring(0, 100)).concat("...");
    }

    protected abstract int zza(T t);

    @Override // com.google.android.gms.internal.zzaml
    public zzaml zzao(zzajq zzajqVar) {
        return zzajqVar.isEmpty() ? this : zzajqVar.zzcvj().zzczb() ? this.biz : zzame.zzczq();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String zzb(zzaml.zza zzaVar) {
        switch (zzaVar) {
            case V1:
            case V2:
                if (this.biz.isEmpty()) {
                    return "";
                }
                String valueOf = String.valueOf(this.biz.zza(zzaVar));
                return new StringBuilder(String.valueOf(valueOf).length() + 10).append("priority:").append(valueOf).append(":").toString();
            default:
                String valueOf2 = String.valueOf(zzaVar);
                throw new IllegalArgumentException(new StringBuilder(String.valueOf(valueOf2).length() + 22).append("Unknown hash version: ").append(valueOf2).toString());
        }
    }

    protected int zzc(zzami<?> zzamiVar) {
        zza zzcyw = zzcyw();
        zza zzcyw2 = zzamiVar.zzcyw();
        return zzcyw.equals(zzcyw2) ? zza((zzami<T>) zzamiVar) : zzcyw.compareTo(zzcyw2);
    }

    @Override // com.google.android.gms.internal.zzaml
    public Iterator<zzamk> zzcrl() {
        return Collections.emptyList().iterator();
    }

    protected abstract zza zzcyw();

    @Override // com.google.android.gms.internal.zzaml
    public String zzczd() {
        if (this.biA == null) {
            this.biA = zzann.zzte(zza(zzaml.zza.V1));
        }
        return this.biA;
    }

    @Override // com.google.android.gms.internal.zzaml
    public boolean zzcze() {
        return true;
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzaml zzczf() {
        return this.biz;
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzaml zze(zzalz zzalzVar, zzaml zzamlVar) {
        return zzalzVar.zzczb() ? zzg(zzamlVar) : !zzamlVar.isEmpty() ? zzame.zzczq().zze(zzalzVar, zzamlVar).zzg(this.biz) : this;
    }

    @Override // java.lang.Comparable
    /* renamed from: zzh */
    public int compareTo(zzaml zzamlVar) {
        if (zzamlVar.isEmpty()) {
            return 1;
        }
        if (zzamlVar instanceof zzama) {
            return -1;
        }
        if (!$assertionsDisabled && !zzamlVar.zzcze()) {
            throw new AssertionError("Node is not leaf node!");
        }
        return (!(this instanceof zzamj) || !(zzamlVar instanceof zzamd)) ? (!(this instanceof zzamd) || !(zzamlVar instanceof zzamj)) ? zzc((zzami) zzamlVar) : zza((zzamj) zzamlVar, (zzamd) this) * (-1) : zza((zzamj) this, (zzamd) zzamlVar);
    }

    @Override // com.google.android.gms.internal.zzaml
    public boolean zzk(zzalz zzalzVar) {
        return false;
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzalz zzl(zzalz zzalzVar) {
        return null;
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzaml zzl(zzajq zzajqVar, zzaml zzamlVar) {
        zzalz zzcvj = zzajqVar.zzcvj();
        if (zzcvj == null) {
            return zzamlVar;
        }
        if (zzamlVar.isEmpty() && !zzcvj.zzczb()) {
            return this;
        }
        if (!$assertionsDisabled && zzajqVar.zzcvj().zzczb() && zzajqVar.size() != 1) {
            throw new AssertionError();
        }
        return zze(zzcvj, zzame.zzczq().zzl(zzajqVar.zzcvk(), zzamlVar));
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzaml zzm(zzalz zzalzVar) {
        return zzalzVar.zzczb() ? this.biz : zzame.zzczq();
    }
}
