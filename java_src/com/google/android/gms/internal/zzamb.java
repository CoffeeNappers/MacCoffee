package com.google.android.gms.internal;

import com.google.android.gms.internal.zzama;
import com.google.android.gms.internal.zzaml;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Stack;
/* loaded from: classes2.dex */
public class zzamb {
    private final List<zzajq> baC;
    private final List<String> baD;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class zza {
        private int biI;
        private final zzc biM;
        private StringBuilder biF = null;
        private Stack<zzalz> biG = new Stack<>();
        private int biH = -1;
        private boolean biJ = true;
        private final List<zzajq> biK = new ArrayList();
        private final List<String> biL = new ArrayList();

        public zza(zzc zzcVar) {
            this.biM = zzcVar;
        }

        private void zza(StringBuilder sb, zzalz zzalzVar) {
            sb.append(zzann.zztf(zzalzVar.asString()));
        }

        private zzajq zzaga(int i) {
            zzalz[] zzalzVarArr = new zzalz[i];
            for (int i2 = 0; i2 < i; i2++) {
                zzalzVarArr[i2] = this.biG.get(i2);
            }
            return new zzajq(zzalzVarArr);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void zzb(zzami<?> zzamiVar) {
            zzczm();
            this.biH = this.biI;
            this.biF.append(zzamiVar.zza(zzaml.zza.V2));
            this.biJ = true;
            if (this.biM.zze(this)) {
                zzczp();
            }
        }

        private void zzczm() {
            if (!zzczj()) {
                this.biF = new StringBuilder();
                this.biF.append("(");
                Iterator<zzalz> it = zzaga(this.biI).iterator();
                while (it.hasNext()) {
                    zza(this.biF, it.next());
                    this.biF.append(":(");
                }
                this.biJ = false;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void zzczn() {
            this.biI--;
            if (zzczj()) {
                this.biF.append(")");
            }
            this.biJ = true;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void zzczo() {
            zzann.zzb(this.biI == 0, "Can't finish hashing in the middle processing a child");
            if (zzczj()) {
                zzczp();
            }
            this.biL.add("");
        }

        private void zzczp() {
            zzann.zzb(zzczj(), "Can't end range without starting a range!");
            for (int i = 0; i < this.biI; i++) {
                this.biF.append(")");
            }
            this.biF.append(")");
            zzajq zzaga = zzaga(this.biH);
            this.biL.add(zzann.zzte(this.biF.toString()));
            this.biK.add(zzaga);
            this.biF = null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void zzn(zzalz zzalzVar) {
            zzczm();
            if (this.biJ) {
                this.biF.append(",");
            }
            zza(this.biF, zzalzVar);
            this.biF.append(":(");
            if (this.biI == this.biG.size()) {
                this.biG.add(zzalzVar);
            } else {
                this.biG.set(this.biI, zzalzVar);
            }
            this.biI++;
            this.biJ = false;
        }

        public boolean zzczj() {
            return this.biF != null;
        }

        public int zzczk() {
            return this.biF.length();
        }

        public zzajq zzczl() {
            return zzaga(this.biI);
        }
    }

    /* loaded from: classes2.dex */
    private static class zzb implements zzc {
        private final long biN;

        public zzb(zzaml zzamlVar) {
            this.biN = Math.max(512L, (long) Math.sqrt(zzani.zzt(zzamlVar) * 100));
        }

        @Override // com.google.android.gms.internal.zzamb.zzc
        public boolean zze(zza zzaVar) {
            return ((long) zzaVar.zzczk()) > this.biN && (zzaVar.zzczl().isEmpty() || !zzaVar.zzczl().zzcvm().equals(zzalz.zzcyz()));
        }
    }

    /* loaded from: classes2.dex */
    public interface zzc {
        boolean zze(zza zzaVar);
    }

    private zzamb(List<zzajq> list, List<String> list2) {
        if (list.size() != list2.size() - 1) {
            throw new IllegalArgumentException("Number of posts need to be n-1 for n hashes in CompoundHash");
        }
        this.baC = list;
        this.baD = list2;
    }

    public static zzamb zza(zzaml zzamlVar, zzc zzcVar) {
        if (zzamlVar.isEmpty()) {
            return new zzamb(Collections.emptyList(), Collections.singletonList(""));
        }
        zza zzaVar = new zza(zzcVar);
        zza(zzamlVar, zzaVar);
        zzaVar.zzczo();
        return new zzamb(zzaVar.biK, zzaVar.biL);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void zza(zzaml zzamlVar, final zza zzaVar) {
        if (zzamlVar.zzcze()) {
            zzaVar.zzb((zzami) zzamlVar);
        } else if (zzamlVar.isEmpty()) {
            throw new IllegalArgumentException("Can't calculate hash on empty node!");
        } else {
            if (!(zzamlVar instanceof zzama)) {
                String valueOf = String.valueOf(zzamlVar);
                throw new IllegalStateException(new StringBuilder(String.valueOf(valueOf).length() + 33).append("Expected children node, but got: ").append(valueOf).toString());
            } else {
                ((zzama) zzamlVar).zza(new zzama.zza() { // from class: com.google.android.gms.internal.zzamb.1
                    @Override // com.google.android.gms.internal.zzama.zza
                    public void zzb(zzalz zzalzVar, zzaml zzamlVar2) {
                        zza.this.zzn(zzalzVar);
                        zzamb.zza(zzamlVar2, zza.this);
                        zza.this.zzczn();
                    }
                }, true);
            }
        }
    }

    public static zzamb zzi(zzaml zzamlVar) {
        return zza(zzamlVar, new zzb(zzamlVar));
    }

    public List<zzajq> zzcsf() {
        return Collections.unmodifiableList(this.baC);
    }

    public List<String> zzcsg() {
        return Collections.unmodifiableList(this.baD);
    }
}
