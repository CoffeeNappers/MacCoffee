package com.google.android.gms.internal;

import com.google.android.gms.internal.zzaim;
import java.util.Comparator;
/* loaded from: classes2.dex */
public abstract class zzaio<K, V> implements zzaim<K, V> {
    private final K bap;
    private zzaim<K, V> baq;
    private final zzaim<K, V> bar;
    private final V value;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzaio(K k, V v, zzaim<K, V> zzaimVar, zzaim<K, V> zzaimVar2) {
        this.bap = k;
        this.value = v;
        this.baq = zzaimVar == null ? zzail.zzcrr() : zzaimVar;
        this.bar = zzaimVar2 == null ? zzail.zzcrr() : zzaimVar2;
    }

    private static zzaim.zza zza(zzaim zzaimVar) {
        return zzaimVar.zzcrq() ? zzaim.zza.BLACK : zzaim.zza.RED;
    }

    private zzaim<K, V> zzcrx() {
        if (this.baq.isEmpty()) {
            return zzail.zzcrr();
        }
        if (!zzcrs().zzcrq() && !zzcrs().zzcrs().zzcrq()) {
            this = zzcry();
        }
        return this.zza(null, null, ((zzaio) this.baq).zzcrx(), null).zzcsa();
    }

    private zzaio<K, V> zzcry() {
        zzaio<K, V> zzcsd = zzcsd();
        return zzcsd.zzcrt().zzcrs().zzcrq() ? zzcsd.zza(null, null, null, ((zzaio) zzcsd.zzcrt()).zzcsc()).zzcsb().zzcsd() : zzcsd;
    }

    private zzaio<K, V> zzcrz() {
        zzaio<K, V> zzcsd = zzcsd();
        return zzcsd.zzcrs().zzcrs().zzcrq() ? zzcsd.zzcsc().zzcsd() : zzcsd;
    }

    private zzaio<K, V> zzcsa() {
        if (this.bar.zzcrq() && !this.baq.zzcrq()) {
            this = zzcsb();
        }
        if (this.baq.zzcrq() && ((zzaio) this.baq).baq.zzcrq()) {
            this = this.zzcsc();
        }
        return (!this.baq.zzcrq() || !this.bar.zzcrq()) ? this : this.zzcsd();
    }

    private zzaio<K, V> zzcsb() {
        return (zzaio) this.bar.zza(null, null, zzcrp(), (zzaio) zza(null, null, zzaim.zza.RED, null, ((zzaio) this.bar).baq), null);
    }

    private zzaio<K, V> zzcsc() {
        return (zzaio) this.baq.zza(null, null, zzcrp(), null, (zzaio) zza(null, null, zzaim.zza.RED, ((zzaio) this.baq).bar, null));
    }

    private zzaio<K, V> zzcsd() {
        return (zzaio) zza(null, null, zza(this), this.baq.zza(null, null, zza(this.baq), null, null), this.bar.zza(null, null, zza(this.bar), null, null));
    }

    @Override // com.google.android.gms.internal.zzaim
    public K getKey() {
        return this.bap;
    }

    @Override // com.google.android.gms.internal.zzaim
    public V getValue() {
        return this.value;
    }

    @Override // com.google.android.gms.internal.zzaim
    public boolean isEmpty() {
        return false;
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zza(K k, V v, Comparator<K> comparator) {
        int compare = comparator.compare(k, this.bap);
        return (compare < 0 ? zza(null, null, this.baq.zza(k, v, comparator), null) : compare == 0 ? zza(k, v, null, null) : zza(null, null, null, this.bar.zza(k, v, comparator))).zzcsa();
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zza(K k, Comparator<K> comparator) {
        zzaio<K, V> zza;
        if (comparator.compare(k, this.bap) < 0) {
            if (!this.baq.isEmpty() && !this.baq.zzcrq() && !((zzaio) this.baq).baq.zzcrq()) {
                this = zzcry();
            }
            zza = this.zza(null, null, this.baq.zza(k, comparator), null);
        } else {
            if (this.baq.zzcrq()) {
                this = zzcsc();
            }
            if (!this.bar.isEmpty() && !this.bar.zzcrq() && !((zzaio) this.bar).baq.zzcrq()) {
                this = this.zzcrz();
            }
            if (comparator.compare(k, this.bap) == 0) {
                if (this.bar.isEmpty()) {
                    return zzail.zzcrr();
                }
                zzaim<K, V> zzcru = this.bar.zzcru();
                this = this.zza(zzcru.getKey(), zzcru.getValue(), null, ((zzaio) this.bar).zzcrx());
            }
            zza = this.zza(null, null, null, this.bar.zza(k, comparator));
        }
        return zza.zzcsa();
    }

    protected abstract zzaio<K, V> zza(K k, V v, zzaim<K, V> zzaimVar, zzaim<K, V> zzaimVar2);

    @Override // com.google.android.gms.internal.zzaim
    public void zza(zzaim.zzb<K, V> zzbVar) {
        this.baq.zza(zzbVar);
        zzbVar.zzk(this.bap, this.value);
        this.bar.zza(zzbVar);
    }

    @Override // com.google.android.gms.internal.zzaim
    /* renamed from: zzb */
    public zzaio<K, V> zza(K k, V v, zzaim.zza zzaVar, zzaim<K, V> zzaimVar, zzaim<K, V> zzaimVar2) {
        if (k == null) {
            k = this.bap;
        }
        if (v == null) {
            v = this.value;
        }
        if (zzaimVar == null) {
            zzaimVar = this.baq;
        }
        if (zzaimVar2 == null) {
            zzaimVar2 = this.bar;
        }
        return zzaVar == zzaim.zza.RED ? new zzain(k, v, zzaimVar, zzaimVar2) : new zzaik(k, v, zzaimVar, zzaimVar2);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzb(zzaim<K, V> zzaimVar) {
        this.baq = zzaimVar;
    }

    protected abstract zzaim.zza zzcrp();

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zzcrs() {
        return this.baq;
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zzcrt() {
        return this.bar;
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zzcru() {
        return this.baq.isEmpty() ? this : this.baq.zzcru();
    }

    @Override // com.google.android.gms.internal.zzaim
    public zzaim<K, V> zzcrv() {
        return this.bar.isEmpty() ? this : this.bar.zzcrv();
    }

    @Override // com.google.android.gms.internal.zzaim
    public int zzcrw() {
        return this.baq.zzcrw() + 1 + this.bar.zzcrw();
    }
}
