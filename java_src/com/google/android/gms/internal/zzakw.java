package com.google.android.gms.internal;

import com.google.android.gms.internal.zzakz;
/* loaded from: classes2.dex */
public class zzakw {
    private static final zzala<Boolean> bgF = new zzala<Boolean>() { // from class: com.google.android.gms.internal.zzakw.1
        @Override // com.google.android.gms.internal.zzala
        /* renamed from: zzf */
        public boolean zzbs(Boolean bool) {
            return !bool.booleanValue();
        }
    };
    private static final zzala<Boolean> bgG = new zzala<Boolean>() { // from class: com.google.android.gms.internal.zzakw.2
        @Override // com.google.android.gms.internal.zzala
        /* renamed from: zzf */
        public boolean zzbs(Boolean bool) {
            return bool.booleanValue();
        }
    };
    private static final zzakz<Boolean> bgH = new zzakz<>(true);
    private static final zzakz<Boolean> bgI = new zzakz<>(false);
    private final zzakz<Boolean> bgE;

    public zzakw() {
        this.bgE = zzakz.zzcxe();
    }

    private zzakw(zzakz<Boolean> zzakzVar) {
        this.bgE = zzakzVar;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof zzakw) && this.bgE.equals(((zzakw) obj).bgE);
    }

    public int hashCode() {
        return this.bgE.hashCode();
    }

    public String toString() {
        String valueOf = String.valueOf(this.bgE.toString());
        return new StringBuilder(String.valueOf(valueOf).length() + 14).append("{PruneForest:").append(valueOf).append("}").toString();
    }

    public <T> T zza(T t, final zzakz.zza<Void, T> zzaVar) {
        return (T) this.bgE.zzb((zzakz<Boolean>) t, new zzakz.zza<Boolean, T>() { // from class: com.google.android.gms.internal.zzakw.3
            /* JADX WARN: Type inference failed for: r5v1, types: [T, java.lang.Object] */
            /* renamed from: zza  reason: avoid collision after fix types in other method */
            public T zza2(zzajq zzajqVar, Boolean bool, T t2) {
                return !bool.booleanValue() ? zzaVar.zza(zzajqVar, null, t2) : t2;
            }

            @Override // com.google.android.gms.internal.zzakz.zza
            public /* bridge */ /* synthetic */ Object zza(zzajq zzajqVar, Boolean bool, Object obj) {
                return zza2(zzajqVar, bool, (Boolean) obj);
            }
        });
    }

    public boolean zzcwz() {
        return this.bgE.zzb(bgG);
    }

    public zzakw zzd(zzalz zzalzVar) {
        zzakz<Boolean> zze = this.bgE.zze(zzalzVar);
        return new zzakw(zze == null ? new zzakz<>(this.bgE.getValue()) : (zze.getValue() != null || this.bgE.getValue() == null) ? zze : zze.zzb(zzajq.zzcvg(), (zzajq) this.bgE.getValue()));
    }

    public boolean zzw(zzajq zzajqVar) {
        Boolean zzah = this.bgE.zzah(zzajqVar);
        return zzah != null && zzah.booleanValue();
    }

    public boolean zzx(zzajq zzajqVar) {
        Boolean zzah = this.bgE.zzah(zzajqVar);
        return zzah != null && !zzah.booleanValue();
    }

    public zzakw zzy(zzajq zzajqVar) {
        if (this.bgE.zzb(zzajqVar, bgF) != null) {
            throw new IllegalArgumentException("Can't prune path that was kept previously!");
        }
        return this.bgE.zzb(zzajqVar, bgG) != null ? this : new zzakw(this.bgE.zza(zzajqVar, bgH));
    }

    public zzakw zzz(zzajq zzajqVar) {
        return this.bgE.zzb(zzajqVar, bgF) != null ? this : new zzakw(this.bgE.zza(zzajqVar, bgI));
    }
}
