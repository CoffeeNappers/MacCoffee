package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaih;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzakz<T> implements Iterable<Map.Entry<zzajq, T>> {
    private static final zzaih bgY = zzaih.zza.zza(zzaiq.zzi(zzalz.class));
    private static final zzakz bgZ = new zzakz(null, bgY);
    private final zzaih<zzalz, zzakz<T>> bgX;
    private final T value;

    /* loaded from: classes2.dex */
    public interface zza<T, R> {
        R zza(zzajq zzajqVar, T t, R r);
    }

    public zzakz(T t) {
        this(t, bgY);
    }

    public zzakz(T t, zzaih<zzalz, zzakz<T>> zzaihVar) {
        this.value = t;
        this.bgX = zzaihVar;
    }

    private <R> R zza(zzajq zzajqVar, zza<? super T, R> zzaVar, R r) {
        Iterator<Map.Entry<zzalz, zzakz<T>>> it = this.bgX.iterator();
        while (it.hasNext()) {
            Map.Entry<zzalz, zzakz<T>> next = it.next();
            r = (R) next.getValue().zza(zzajqVar.zza(next.getKey()), zzaVar, r);
        }
        return this.value != null ? zzaVar.zza(zzajqVar, this.value, r) : r;
    }

    public static <V> zzakz<V> zzcxe() {
        return bgZ;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        zzakz zzakzVar = (zzakz) obj;
        if (this.bgX == null ? zzakzVar.bgX != null : !this.bgX.equals(zzakzVar.bgX)) {
            return false;
        }
        if (this.value != null) {
            if (this.value.equals(zzakzVar.value)) {
                return true;
            }
        } else if (zzakzVar.value == null) {
            return true;
        }
        return false;
    }

    public T getValue() {
        return this.value;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = (this.value != null ? this.value.hashCode() : 0) * 31;
        if (this.bgX != null) {
            i = this.bgX.hashCode();
        }
        return hashCode + i;
    }

    public boolean isEmpty() {
        return this.value == null && this.bgX.isEmpty();
    }

    @Override // java.lang.Iterable
    public Iterator<Map.Entry<zzajq, T>> iterator() {
        final ArrayList arrayList = new ArrayList();
        zza(new zza<T, Void>() { // from class: com.google.android.gms.internal.zzakz.2
            @Override // com.google.android.gms.internal.zzakz.zza
            public /* bridge */ /* synthetic */ Void zza(zzajq zzajqVar, Object obj, Void r4) {
                return zza2(zzajqVar, (zzajq) obj, r4);
            }

            /* renamed from: zza  reason: avoid collision after fix types in other method */
            public Void zza2(zzajq zzajqVar, T t, Void r5) {
                arrayList.add(new AbstractMap.SimpleImmutableEntry(zzajqVar, t));
                return null;
            }
        });
        return arrayList.iterator();
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ImmutableTree { value=");
        sb.append(getValue());
        sb.append(", children={");
        Iterator<Map.Entry<zzalz, zzakz<T>>> it = this.bgX.iterator();
        while (it.hasNext()) {
            Map.Entry<zzalz, zzakz<T>> next = it.next();
            sb.append(next.getKey().asString());
            sb.append("=");
            sb.append(next.getValue());
        }
        sb.append("} }");
        return sb.toString();
    }

    public Collection<T> values() {
        final ArrayList arrayList = new ArrayList();
        zza(new zza<T, Void>() { // from class: com.google.android.gms.internal.zzakz.1
            @Override // com.google.android.gms.internal.zzakz.zza
            public /* bridge */ /* synthetic */ Void zza(zzajq zzajqVar, Object obj, Void r4) {
                return zza2(zzajqVar, (zzajq) obj, r4);
            }

            /* renamed from: zza  reason: avoid collision after fix types in other method */
            public Void zza2(zzajq zzajqVar, T t, Void r4) {
                arrayList.add(t);
                return null;
            }
        });
        return arrayList;
    }

    public zzajq zza(zzajq zzajqVar, zzala<? super T> zzalaVar) {
        zzalz zzcvj;
        zzakz<T> zzakzVar;
        zzajq zza2;
        if (this.value == null || !zzalaVar.zzbs((T) this.value)) {
            if (!zzajqVar.isEmpty() && (zzakzVar = this.bgX.get((zzcvj = zzajqVar.zzcvj()))) != null && (zza2 = zzakzVar.zza(zzajqVar.zzcvk(), zzalaVar)) != null) {
                return new zzajq(zzcvj).zzh(zza2);
            }
            return null;
        }
        return zzajq.zzcvg();
    }

    public zzakz<T> zza(zzajq zzajqVar, zzakz<T> zzakzVar) {
        if (zzajqVar.isEmpty()) {
            return zzakzVar;
        }
        zzalz zzcvj = zzajqVar.zzcvj();
        zzakz<T> zzakzVar2 = this.bgX.get(zzcvj);
        if (zzakzVar2 == null) {
            zzakzVar2 = zzcxe();
        }
        zzakz<T> zza2 = zzakzVar2.zza(zzajqVar.zzcvk(), zzakzVar);
        return new zzakz<>(this.value, zza2.isEmpty() ? this.bgX.zzbg(zzcvj) : this.bgX.zzj(zzcvj, zza2));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void zza(zza<T, Void> zzaVar) {
        zza(zzajq.zzcvg(), zzaVar, null);
    }

    public zzajq zzag(zzajq zzajqVar) {
        return zza(zzajqVar, zzala.bhd);
    }

    public T zzah(zzajq zzajqVar) {
        return zzc(zzajqVar, zzala.bhd);
    }

    public zzakz<T> zzai(zzajq zzajqVar) {
        if (zzajqVar.isEmpty()) {
            return this;
        }
        zzakz<T> zzakzVar = this.bgX.get(zzajqVar.zzcvj());
        return zzakzVar != null ? zzakzVar.zzai(zzajqVar.zzcvk()) : zzcxe();
    }

    public zzakz<T> zzaj(zzajq zzajqVar) {
        if (zzajqVar.isEmpty()) {
            return this.bgX.isEmpty() ? zzcxe() : new zzakz<>(null, this.bgX);
        }
        zzalz zzcvj = zzajqVar.zzcvj();
        zzakz<T> zzakzVar = this.bgX.get(zzcvj);
        if (zzakzVar == null) {
            return this;
        }
        zzakz<T> zzaj = zzakzVar.zzaj(zzajqVar.zzcvk());
        zzaih<zzalz, zzakz<T>> zzbg = zzaj.isEmpty() ? this.bgX.zzbg(zzcvj) : this.bgX.zzj(zzcvj, zzaj);
        return (this.value != null || !zzbg.isEmpty()) ? new zzakz<>(this.value, zzbg) : zzcxe();
    }

    public T zzak(zzajq zzajqVar) {
        if (zzajqVar.isEmpty()) {
            return this.value;
        }
        zzakz<T> zzakzVar = this.bgX.get(zzajqVar.zzcvj());
        if (zzakzVar == null) {
            return null;
        }
        return zzakzVar.zzak(zzajqVar.zzcvk());
    }

    public zzakz<T> zzb(zzajq zzajqVar, T t) {
        if (zzajqVar.isEmpty()) {
            return new zzakz<>(t, this.bgX);
        }
        zzalz zzcvj = zzajqVar.zzcvj();
        zzakz<T> zzakzVar = this.bgX.get(zzcvj);
        if (zzakzVar == null) {
            zzakzVar = zzcxe();
        }
        return new zzakz<>(this.value, this.bgX.zzj(zzcvj, zzakzVar.zzb(zzajqVar.zzcvk(), (zzajq) t)));
    }

    public T zzb(zzajq zzajqVar, zzala<? super T> zzalaVar) {
        if (this.value == null || !zzalaVar.zzbs((T) this.value)) {
            Iterator<zzalz> it = zzajqVar.iterator();
            while (it.hasNext()) {
                zzakz<T> zzakzVar = this.bgX.get(it.next());
                if (zzakzVar == null) {
                    return null;
                }
                if (zzakzVar.value != null && zzalaVar.zzbs((T) zzakzVar.value)) {
                    return zzakzVar.value;
                }
                this = zzakzVar;
            }
            return null;
        }
        return this.value;
    }

    public <R> R zzb(R r, zza<? super T, R> zzaVar) {
        return (R) zza(zzajq.zzcvg(), zzaVar, r);
    }

    public boolean zzb(zzala<? super T> zzalaVar) {
        if (this.value == null || !zzalaVar.zzbs((T) this.value)) {
            Iterator<Map.Entry<zzalz, zzakz<T>>> it = this.bgX.iterator();
            while (it.hasNext()) {
                if (it.next().getValue().zzb(zzalaVar)) {
                    return true;
                }
            }
            return false;
        }
        return true;
    }

    public T zzc(zzajq zzajqVar, zzala<? super T> zzalaVar) {
        T t = (this.value == null || !zzalaVar.zzbs((T) this.value)) ? null : this.value;
        Iterator<zzalz> it = zzajqVar.iterator();
        T t2 = t;
        while (it.hasNext()) {
            zzakz<T> zzakzVar = this.bgX.get(it.next());
            if (zzakzVar == null) {
                break;
            }
            if (zzakzVar.value != null && zzalaVar.zzbs((T) zzakzVar.value)) {
                t2 = zzakzVar.value;
            }
            this = zzakzVar;
        }
        return t2;
    }

    public zzaih<zzalz, zzakz<T>> zzcxf() {
        return this.bgX;
    }

    public zzakz<T> zze(zzalz zzalzVar) {
        zzakz<T> zzakzVar = this.bgX.get(zzalzVar);
        return zzakzVar != null ? zzakzVar : zzcxe();
    }
}
