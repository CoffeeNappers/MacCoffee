package com.google.android.gms.analytics;

import com.google.android.gms.common.internal.zzaa;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes2.dex */
public final class zze {
    private final zzh aW;
    private boolean aX;
    private long aY;
    private long aZ;
    private long ba;
    private long bb;
    private long bc;
    private boolean bd;
    private final Map<Class<? extends zzg>, zzg> be;
    private final List<zzk> bf;
    private final com.google.android.gms.common.util.zze zzaql;

    zze(zze zzeVar) {
        this.aW = zzeVar.aW;
        this.zzaql = zzeVar.zzaql;
        this.aY = zzeVar.aY;
        this.aZ = zzeVar.aZ;
        this.ba = zzeVar.ba;
        this.bb = zzeVar.bb;
        this.bc = zzeVar.bc;
        this.bf = new ArrayList(zzeVar.bf);
        this.be = new HashMap(zzeVar.be.size());
        for (Map.Entry<Class<? extends zzg>, zzg> entry : zzeVar.be.entrySet()) {
            zzg zzc = zzc(entry.getKey());
            entry.getValue().zzb(zzc);
            this.be.put(entry.getKey(), zzc);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zze(zzh zzhVar, com.google.android.gms.common.util.zze zzeVar) {
        zzaa.zzy(zzhVar);
        zzaa.zzy(zzeVar);
        this.aW = zzhVar;
        this.zzaql = zzeVar;
        this.bb = 1800000L;
        this.bc = 3024000000L;
        this.be = new HashMap();
        this.bf = new ArrayList();
    }

    private static <T extends zzg> T zzc(Class<T> cls) {
        try {
            return cls.newInstance();
        } catch (IllegalAccessException e) {
            throw new IllegalArgumentException("dataType default constructor is not accessible", e);
        } catch (InstantiationException e2) {
            throw new IllegalArgumentException("dataType doesn't have default constructor", e2);
        }
    }

    public <T extends zzg> T zza(Class<T> cls) {
        return (T) this.be.get(cls);
    }

    public void zza(zzg zzgVar) {
        zzaa.zzy(zzgVar);
        Class<?> cls = zzgVar.getClass();
        if (cls.getSuperclass() != zzg.class) {
            throw new IllegalArgumentException();
        }
        zzgVar.zzb(zzb(cls));
    }

    public <T extends zzg> T zzb(Class<T> cls) {
        T t = (T) this.be.get(cls);
        if (t == null) {
            T t2 = (T) zzc(cls);
            this.be.put(cls, t2);
            return t2;
        }
        return t;
    }

    public void zzp(long j) {
        this.aZ = j;
    }

    public zze zzzi() {
        return new zze(this);
    }

    public Collection<zzg> zzzj() {
        return this.be.values();
    }

    public List<zzk> zzzk() {
        return this.bf;
    }

    public long zzzl() {
        return this.aY;
    }

    public void zzzm() {
        zzzq().zze(this);
    }

    public boolean zzzn() {
        return this.aX;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzzo() {
        this.ba = this.zzaql.elapsedRealtime();
        if (this.aZ != 0) {
            this.aY = this.aZ;
        } else {
            this.aY = this.zzaql.currentTimeMillis();
        }
        this.aX = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzh zzzp() {
        return this.aW;
    }

    zzi zzzq() {
        return this.aW.zzzq();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean zzzr() {
        return this.bd;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzzs() {
        this.bd = true;
    }
}
