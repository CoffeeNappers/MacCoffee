package com.google.android.gms.internal;

import java.util.Map;
/* loaded from: classes2.dex */
public class zzalb<T> {
    static final /* synthetic */ boolean $assertionsDisabled;
    private zzalz bhe;
    private zzalb<T> bhf;
    private zzalc<T> bhg;

    /* loaded from: classes2.dex */
    public interface zza<T> {
        boolean zze(zzalb<T> zzalbVar);
    }

    /* loaded from: classes2.dex */
    public interface zzb<T> {
        void zzd(zzalb<T> zzalbVar);
    }

    static {
        $assertionsDisabled = !zzalb.class.desiredAssertionStatus();
    }

    public zzalb() {
        this(null, null, new zzalc());
    }

    public zzalb(zzalz zzalzVar, zzalb<T> zzalbVar, zzalc<T> zzalcVar) {
        this.bhe = zzalzVar;
        this.bhf = zzalbVar;
        this.bhg = zzalcVar;
    }

    private void zza(zzalz zzalzVar, zzalb<T> zzalbVar) {
        boolean isEmpty = zzalbVar.isEmpty();
        boolean containsKey = this.bhg.bfa.containsKey(zzalzVar);
        if (isEmpty && containsKey) {
            this.bhg.bfa.remove(zzalzVar);
            zzcxg();
        } else if (isEmpty || containsKey) {
        } else {
            this.bhg.bfa.put(zzalzVar, zzalbVar.bhg);
            zzcxg();
        }
    }

    private void zzcxg() {
        if (this.bhf != null) {
            this.bhf.zza(this.bhe, this);
        }
    }

    public T getValue() {
        return this.bhg.value;
    }

    public boolean hasChildren() {
        return !this.bhg.bfa.isEmpty();
    }

    public boolean isEmpty() {
        return this.bhg.value == null && this.bhg.bfa.isEmpty();
    }

    public void setValue(T t) {
        this.bhg.value = t;
        zzcxg();
    }

    public String toString() {
        return toString("");
    }

    String toString(String str) {
        String asString = this.bhe == null ? "<anon>" : this.bhe.asString();
        String valueOf = String.valueOf(this.bhg.toString(String.valueOf(str).concat("\t")));
        return new StringBuilder(String.valueOf(str).length() + 1 + String.valueOf(asString).length() + String.valueOf(valueOf).length()).append(str).append(asString).append("\n").append(valueOf).toString();
    }

    public void zza(zzb<T> zzbVar) {
        zza(zzbVar, false, false);
    }

    public void zza(final zzb<T> zzbVar, boolean z, final boolean z2) {
        if (z && !z2) {
            zzbVar.zzd(this);
        }
        zzb(new zzb<T>() { // from class: com.google.android.gms.internal.zzalb.1
            @Override // com.google.android.gms.internal.zzalb.zzb
            public void zzd(zzalb<T> zzalbVar) {
                zzalbVar.zza(zzbVar, true, z2);
            }
        });
        if (!z || !z2) {
            return;
        }
        zzbVar.zzd(this);
    }

    public boolean zza(zza<T> zzaVar) {
        return zza((zza) zzaVar, false);
    }

    public boolean zza(zza<T> zzaVar, boolean z) {
        if (!z) {
            this = this.bhf;
        }
        while (this != null) {
            zzaVar.zze(this);
            this = this.bhf;
        }
        return false;
    }

    public zzalb<T> zzal(zzajq zzajqVar) {
        zzalz zzcvj = zzajqVar.zzcvj();
        while (zzcvj != null) {
            zzalb<T> zzalbVar = new zzalb<>(zzcvj, this, this.bhg.bfa.containsKey(zzcvj) ? this.bhg.bfa.get(zzcvj) : new zzalc<>());
            zzajqVar = zzajqVar.zzcvk();
            zzcvj = zzajqVar.zzcvj();
            this = zzalbVar;
        }
        return this;
    }

    public void zzb(zzb<T> zzbVar) {
        Object[] array = this.bhg.bfa.entrySet().toArray();
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 < array.length) {
                Map.Entry entry = (Map.Entry) array[i2];
                zzbVar.zzd(new zzalb<>((zzalz) entry.getKey(), this, (zzalc) entry.getValue()));
                i = i2 + 1;
            } else {
                return;
            }
        }
    }

    public zzajq zzcrc() {
        if (this.bhf == null) {
            return this.bhe != null ? new zzajq(this.bhe) : zzajq.zzcvg();
        } else if (!$assertionsDisabled && this.bhe == null) {
            throw new AssertionError();
        } else {
            return this.bhf.zzcrc().zza(this.bhe);
        }
    }
}
