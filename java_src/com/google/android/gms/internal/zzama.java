package com.google.android.gms.internal;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.google.android.gms.internal.zzaih;
import com.google.android.gms.internal.zzaim;
import com.google.android.gms.internal.zzaml;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzama implements zzaml {
    static final /* synthetic */ boolean $assertionsDisabled;
    public static Comparator<zzalz> biy;
    private final zzaih<zzalz, zzaml> bgX;
    private String biA;
    private final zzaml biz;

    /* loaded from: classes2.dex */
    public static abstract class zza extends zzaim.zzb<zzalz, zzaml> {
        public abstract void zzb(zzalz zzalzVar, zzaml zzamlVar);

        @Override // com.google.android.gms.internal.zzaim.zzb
        /* renamed from: zzf */
        public void zzk(zzalz zzalzVar, zzaml zzamlVar) {
            zzb(zzalzVar, zzamlVar);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class zzb implements Iterator<zzamk> {
        private final Iterator<Map.Entry<zzalz, zzaml>> bak;

        public zzb(Iterator<Map.Entry<zzalz, zzaml>> it) {
            this.bak = it;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.bak.hasNext();
        }

        @Override // java.util.Iterator
        public void remove() {
            this.bak.remove();
        }

        @Override // java.util.Iterator
        /* renamed from: zzczi */
        public zzamk next() {
            Map.Entry<zzalz, zzaml> next = this.bak.next();
            return new zzamk(next.getKey(), next.getValue());
        }
    }

    static {
        $assertionsDisabled = !zzama.class.desiredAssertionStatus();
        biy = new Comparator<zzalz>() { // from class: com.google.android.gms.internal.zzama.1
            @Override // java.util.Comparator
            /* renamed from: zza */
            public int compare(zzalz zzalzVar, zzalz zzalzVar2) {
                return zzalzVar.compareTo(zzalzVar2);
            }
        };
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzama() {
        this.biA = null;
        this.bgX = zzaih.zza.zza(biy);
        this.biz = zzamp.c();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public zzama(zzaih<zzalz, zzaml> zzaihVar, zzaml zzamlVar) {
        this.biA = null;
        if (!zzaihVar.isEmpty() || zzamlVar.isEmpty()) {
            this.biz = zzamlVar;
            this.bgX = zzaihVar;
            return;
        }
        throw new IllegalArgumentException("Can't create empty ChildrenNode with priority!");
    }

    private static void zzb(StringBuilder sb, int i) {
        for (int i2 = 0; i2 < i; i2++) {
            sb.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        }
    }

    private void zzc(StringBuilder sb, int i) {
        if (this.bgX.isEmpty() && this.biz.isEmpty()) {
            sb.append("{ }");
            return;
        }
        sb.append("{\n");
        Iterator<Map.Entry<zzalz, zzaml>> it = this.bgX.iterator();
        while (it.hasNext()) {
            Map.Entry<zzalz, zzaml> next = it.next();
            zzb(sb, i + 2);
            sb.append(next.getKey().asString());
            sb.append("=");
            if (next.getValue() instanceof zzama) {
                ((zzama) next.getValue()).zzc(sb, i + 2);
            } else {
                sb.append(next.getValue().toString());
            }
            sb.append("\n");
        }
        if (!this.biz.isEmpty()) {
            zzb(sb, i + 2);
            sb.append(".priority=");
            sb.append(this.biz.toString());
            sb.append("\n");
        }
        zzb(sb, i);
        sb.append("}");
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof zzama)) {
            return false;
        }
        zzama zzamaVar = (zzama) obj;
        if (zzczf().equals(zzamaVar.zzczf()) && this.bgX.size() == zzamaVar.bgX.size()) {
            Iterator<Map.Entry<zzalz, zzaml>> it = this.bgX.iterator();
            Iterator<Map.Entry<zzalz, zzaml>> it2 = zzamaVar.bgX.iterator();
            while (it.hasNext() && it2.hasNext()) {
                Map.Entry<zzalz, zzaml> next = it.next();
                Map.Entry<zzalz, zzaml> next2 = it2.next();
                if (next.getKey().equals(next2.getKey()) || !next.getValue().equals(next2.getValue())) {
                    return false;
                }
                while (it.hasNext()) {
                    Map.Entry<zzalz, zzaml> next3 = it.next();
                    Map.Entry<zzalz, zzaml> next22 = it2.next();
                    if (next3.getKey().equals(next22.getKey())) {
                    }
                    return false;
                }
            }
            if (!it.hasNext() && !it2.hasNext()) {
                return true;
            }
            throw new IllegalStateException("Something went wrong internally.");
        }
        return false;
    }

    @Override // com.google.android.gms.internal.zzaml
    public int getChildCount() {
        return this.bgX.size();
    }

    @Override // com.google.android.gms.internal.zzaml
    public Object getValue() {
        return getValue(false);
    }

    @Override // com.google.android.gms.internal.zzaml
    public Object getValue(boolean z) {
        boolean z2;
        if (isEmpty()) {
            return null;
        }
        HashMap hashMap = new HashMap();
        Iterator<Map.Entry<zzalz, zzaml>> it = this.bgX.iterator();
        boolean z3 = true;
        int i = 0;
        int i2 = 0;
        while (it.hasNext()) {
            Map.Entry<zzalz, zzaml> next = it.next();
            String asString = next.getKey().asString();
            hashMap.put(asString, next.getValue().getValue(z));
            i2++;
            if (z3) {
                if (asString.length() <= 1 || asString.charAt(0) != '0') {
                    Integer zztg = zzann.zztg(asString);
                    if (zztg == null || zztg.intValue() < 0) {
                        z2 = false;
                    } else if (zztg.intValue() > i) {
                        i = zztg.intValue();
                        z2 = z3;
                    }
                } else {
                    z2 = false;
                }
                z3 = z2;
                i = i;
            }
            z2 = z3;
            z3 = z2;
            i = i;
        }
        if (z || !z3 || i >= i2 * 2) {
            if (z && !this.biz.isEmpty()) {
                hashMap.put(".priority", this.biz.getValue());
            }
            return hashMap;
        }
        ArrayList arrayList = new ArrayList(i + 1);
        for (int i3 = 0; i3 <= i; i3++) {
            arrayList.add(hashMap.get(new StringBuilder(11).append(i3).toString()));
        }
        return arrayList;
    }

    public int hashCode() {
        int i = 0;
        Iterator<zzamk> it = iterator();
        while (true) {
            int i2 = i;
            if (it.hasNext()) {
                zzamk next = it.next();
                i = next.zzcqy().hashCode() + (((i2 * 31) + next.a().hashCode()) * 17);
            } else {
                return i2;
            }
        }
    }

    @Override // com.google.android.gms.internal.zzaml
    public boolean isEmpty() {
        return this.bgX.isEmpty();
    }

    @Override // java.lang.Iterable
    public Iterator<zzamk> iterator() {
        return new zzb(this.bgX.iterator());
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        zzc(sb, 0);
        return sb.toString();
    }

    @Override // com.google.android.gms.internal.zzaml
    public String zza(zzaml.zza zzaVar) {
        if (zzaVar != zzaml.zza.V1) {
            throw new IllegalArgumentException("Hashes on children nodes only supported for V1");
        }
        StringBuilder sb = new StringBuilder();
        if (!this.biz.isEmpty()) {
            sb.append("priority:");
            sb.append(this.biz.zza(zzaml.zza.V1));
            sb.append(":");
        }
        ArrayList<zzamk> arrayList = new ArrayList();
        Iterator<zzamk> it = iterator();
        boolean z = false;
        while (it.hasNext()) {
            zzamk next = it.next();
            arrayList.add(next);
            z = z || !next.zzcqy().zzczf().isEmpty();
        }
        if (z) {
            Collections.sort(arrayList, zzamo.b());
        }
        for (zzamk zzamkVar : arrayList) {
            String zzczd = zzamkVar.zzcqy().zzczd();
            if (!zzczd.equals("")) {
                sb.append(":");
                sb.append(zzamkVar.a().asString());
                sb.append(":");
                sb.append(zzczd);
            }
        }
        return sb.toString();
    }

    public void zza(zza zzaVar) {
        zza(zzaVar, false);
    }

    public void zza(final zza zzaVar, boolean z) {
        if (!z || zzczf().isEmpty()) {
            this.bgX.zza(zzaVar);
        } else {
            this.bgX.zza(new zzaim.zzb<zzalz, zzaml>() { // from class: com.google.android.gms.internal.zzama.2
                boolean biB = false;

                @Override // com.google.android.gms.internal.zzaim.zzb
                /* renamed from: zzf */
                public void zzk(zzalz zzalzVar, zzaml zzamlVar) {
                    if (!this.biB && zzalzVar.compareTo(zzalz.zzcyz()) > 0) {
                        this.biB = true;
                        zzaVar.zzb(zzalz.zzcyz(), zzama.this.zzczf());
                    }
                    zzaVar.zzb(zzalzVar, zzamlVar);
                }
            });
        }
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzaml zzao(zzajq zzajqVar) {
        zzalz zzcvj = zzajqVar.zzcvj();
        return zzcvj == null ? this : zzm(zzcvj).zzao(zzajqVar.zzcvk());
    }

    @Override // com.google.android.gms.internal.zzaml
    public Iterator<zzamk> zzcrl() {
        return new zzb(this.bgX.zzcrl());
    }

    @Override // com.google.android.gms.internal.zzaml
    public String zzczd() {
        if (this.biA == null) {
            String zza2 = zza(zzaml.zza.V1);
            this.biA = zza2.isEmpty() ? "" : zzann.zzte(zza2);
        }
        return this.biA;
    }

    @Override // com.google.android.gms.internal.zzaml
    public boolean zzcze() {
        return false;
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzaml zzczf() {
        return this.biz;
    }

    public zzalz zzczg() {
        return this.bgX.zzcrj();
    }

    public zzalz zzczh() {
        return this.bgX.zzcrk();
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzaml zze(zzalz zzalzVar, zzaml zzamlVar) {
        if (zzalzVar.zzczb()) {
            return zzg(zzamlVar);
        }
        zzaih<zzalz, zzaml> zzaihVar = this.bgX;
        if (zzaihVar.containsKey(zzalzVar)) {
            zzaihVar = zzaihVar.zzbg(zzalzVar);
        }
        if (!zzamlVar.isEmpty()) {
            zzaihVar = zzaihVar.zzj(zzalzVar, zzamlVar);
        }
        return zzaihVar.isEmpty() ? zzame.zzczq() : new zzama(zzaihVar, this.biz);
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzaml zzg(zzaml zzamlVar) {
        return this.bgX.isEmpty() ? zzame.zzczq() : new zzama(this.bgX, zzamlVar);
    }

    @Override // java.lang.Comparable
    /* renamed from: zzh */
    public int compareTo(zzaml zzamlVar) {
        if (isEmpty()) {
            return zzamlVar.isEmpty() ? 0 : -1;
        }
        if (!zzamlVar.zzcze() && !zzamlVar.isEmpty()) {
            return zzamlVar == zzaml.bjd ? -1 : 0;
        }
        return 1;
    }

    @Override // com.google.android.gms.internal.zzaml
    public boolean zzk(zzalz zzalzVar) {
        return !zzm(zzalzVar).isEmpty();
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzalz zzl(zzalz zzalzVar) {
        return this.bgX.zzbh(zzalzVar);
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzaml zzl(zzajq zzajqVar, zzaml zzamlVar) {
        zzalz zzcvj = zzajqVar.zzcvj();
        if (zzcvj == null) {
            return zzamlVar;
        }
        if (!zzcvj.zzczb()) {
            return zze(zzcvj, zzm(zzcvj).zzl(zzajqVar.zzcvk(), zzamlVar));
        }
        if (!$assertionsDisabled && !zzamp.zzq(zzamlVar)) {
            throw new AssertionError();
        }
        return zzg(zzamlVar);
    }

    @Override // com.google.android.gms.internal.zzaml
    public zzaml zzm(zzalz zzalzVar) {
        return (!zzalzVar.zzczb() || this.biz.isEmpty()) ? this.bgX.containsKey(zzalzVar) ? this.bgX.get(zzalzVar) : zzame.zzczq() : this.biz;
    }
}
