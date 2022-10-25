package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public final class zzaqe implements zzapl {
    private final zzaps bod;

    public zzaqe(zzaps zzapsVar) {
        this.bod = zzapsVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static zzapk<?> zza(zzaps zzapsVar, zzaos zzaosVar, zzaqo<?> zzaqoVar, zzapm zzapmVar) {
        Class<?> value = zzapmVar.value();
        if (zzapk.class.isAssignableFrom(value)) {
            return (zzapk) zzapsVar.zzb(zzaqo.zzr(value)).bj();
        }
        if (!zzapl.class.isAssignableFrom(value)) {
            throw new IllegalArgumentException("@JsonAdapter value must be TypeAdapter or TypeAdapterFactory reference.");
        }
        return ((zzapl) zzapsVar.zzb(zzaqo.zzr(value)).bj()).zza(zzaosVar, zzaqoVar);
    }

    @Override // com.google.android.gms.internal.zzapl
    public <T> zzapk<T> zza(zzaos zzaosVar, zzaqo<T> zzaqoVar) {
        zzapm zzapmVar = (zzapm) zzaqoVar.bB().getAnnotation(zzapm.class);
        if (zzapmVar == null) {
            return null;
        }
        return (zzapk<T>) zza(this.bod, zzaosVar, zzaqoVar, zzapmVar);
    }
}
