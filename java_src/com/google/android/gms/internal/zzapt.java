package com.google.android.gms.internal;

import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public final class zzapt implements zzapl, Cloneable {
    public static final zzapt boW = new zzapt();
    private double boX = -1.0d;
    private int boY = 136;
    private boolean boZ = true;
    private List<zzaoo> bpa = Collections.emptyList();
    private List<zzaoo> bpb = Collections.emptyList();

    private boolean zza(zzapo zzapoVar) {
        return zzapoVar == null || zzapoVar.bi() <= this.boX;
    }

    private boolean zza(zzapo zzapoVar, zzapp zzappVar) {
        return zza(zzapoVar) && zza(zzappVar);
    }

    private boolean zza(zzapp zzappVar) {
        return zzappVar == null || zzappVar.bi() > this.boX;
    }

    private boolean zzm(Class<?> cls) {
        return !Enum.class.isAssignableFrom(cls) && (cls.isAnonymousClass() || cls.isLocalClass());
    }

    private boolean zzn(Class<?> cls) {
        return cls.isMemberClass() && !zzo(cls);
    }

    private boolean zzo(Class<?> cls) {
        return (cls.getModifiers() & 8) != 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* renamed from: bk */
    public zzapt clone() {
        try {
            return (zzapt) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError();
        }
    }

    @Override // com.google.android.gms.internal.zzapl
    public <T> zzapk<T> zza(final zzaos zzaosVar, final zzaqo<T> zzaqoVar) {
        Class<? super T> bB = zzaqoVar.bB();
        final boolean zza = zza((Class<?>) bB, true);
        final boolean zza2 = zza((Class<?>) bB, false);
        if (zza || zza2) {
            return new zzapk<T>() { // from class: com.google.android.gms.internal.zzapt.1
                private zzapk<T> bol;

                private zzapk<T> bg() {
                    zzapk<T> zzapkVar = this.bol;
                    if (zzapkVar != 0) {
                        return zzapkVar;
                    }
                    zzapk<T> zza3 = zzaosVar.zza(zzapt.this, zzaqoVar);
                    this.bol = zza3;
                    return zza3;
                }

                @Override // com.google.android.gms.internal.zzapk
                public void zza(zzaqr zzaqrVar, T t) throws IOException {
                    if (zza) {
                        zzaqrVar.bA();
                    } else {
                        bg().zza(zzaqrVar, t);
                    }
                }

                /* JADX WARN: Type inference failed for: r0v2, types: [T, java.lang.Object] */
                @Override // com.google.android.gms.internal.zzapk
                public T zzb(zzaqp zzaqpVar) throws IOException {
                    if (zza2) {
                        zzaqpVar.skipValue();
                        return null;
                    }
                    return bg().zzb(zzaqpVar);
                }
            };
        }
        return null;
    }

    public zzapt zza(zzaoo zzaooVar, boolean z, boolean z2) {
        zzapt clone = clone();
        if (z) {
            clone.bpa = new ArrayList(this.bpa);
            clone.bpa.add(zzaooVar);
        }
        if (z2) {
            clone.bpb = new ArrayList(this.bpb);
            clone.bpb.add(zzaooVar);
        }
        return clone;
    }

    public boolean zza(Class<?> cls, boolean z) {
        if (this.boX == -1.0d || zza((zzapo) cls.getAnnotation(zzapo.class), (zzapp) cls.getAnnotation(zzapp.class))) {
            if ((this.boZ || !zzn(cls)) && !zzm(cls)) {
                for (zzaoo zzaooVar : z ? this.bpa : this.bpb) {
                    if (zzaooVar.zzh(cls)) {
                        return true;
                    }
                }
                return false;
            }
            return true;
        }
        return true;
    }

    public boolean zza(Field field, boolean z) {
        if ((this.boY & field.getModifiers()) != 0) {
            return true;
        }
        if ((this.boX == -1.0d || zza((zzapo) field.getAnnotation(zzapo.class), (zzapp) field.getAnnotation(zzapp.class))) && !field.isSynthetic()) {
            if ((this.boZ || !zzn(field.getType())) && !zzm(field.getType())) {
                List<zzaoo> list = z ? this.bpa : this.bpb;
                if (!list.isEmpty()) {
                    zzaop zzaopVar = new zzaop(field);
                    for (zzaoo zzaooVar : list) {
                        if (zzaooVar.zza(zzaopVar)) {
                            return true;
                        }
                    }
                }
                return false;
            }
            return true;
        }
        return true;
    }

    public zzapt zzg(int... iArr) {
        zzapt clone = clone();
        clone.boY = 0;
        for (int i : iArr) {
            clone.boY = i | clone.boY;
        }
        return clone;
    }
}
