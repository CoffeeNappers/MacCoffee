package com.google.android.gms.internal;

import java.util.Iterator;
/* loaded from: classes2.dex */
public interface zzaml extends Comparable<zzaml>, Iterable<zzamk> {
    public static final zzama bjd = new zzama() { // from class: com.google.android.gms.internal.zzaml.1
        @Override // com.google.android.gms.internal.zzama
        public boolean equals(Object obj) {
            return obj == this;
        }

        @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
        public boolean isEmpty() {
            return false;
        }

        @Override // com.google.android.gms.internal.zzama
        public String toString() {
            return "<Max Node>";
        }

        @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
        public zzaml zzczf() {
            return this;
        }

        @Override // com.google.android.gms.internal.zzama, java.lang.Comparable
        /* renamed from: zzh */
        public int compareTo(zzaml zzamlVar) {
            return zzamlVar == this ? 0 : 1;
        }

        @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
        public boolean zzk(zzalz zzalzVar) {
            return false;
        }

        @Override // com.google.android.gms.internal.zzama, com.google.android.gms.internal.zzaml
        public zzaml zzm(zzalz zzalzVar) {
            return zzalzVar.zzczb() ? zzczf() : zzame.zzczq();
        }
    };

    /* loaded from: classes2.dex */
    public enum zza {
        V1,
        V2
    }

    int getChildCount();

    Object getValue();

    Object getValue(boolean z);

    boolean isEmpty();

    String zza(zza zzaVar);

    zzaml zzao(zzajq zzajqVar);

    Iterator<zzamk> zzcrl();

    String zzczd();

    boolean zzcze();

    zzaml zzczf();

    zzaml zze(zzalz zzalzVar, zzaml zzamlVar);

    zzaml zzg(zzaml zzamlVar);

    boolean zzk(zzalz zzalzVar);

    zzalz zzl(zzalz zzalzVar);

    zzaml zzl(zzajq zzajqVar, zzaml zzamlVar);

    zzaml zzm(zzalz zzalzVar);
}
