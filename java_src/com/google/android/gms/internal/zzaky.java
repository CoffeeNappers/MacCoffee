package com.google.android.gms.internal;

import com.google.android.gms.internal.zzakz;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
/* loaded from: classes2.dex */
public class zzaky {
    static final /* synthetic */ boolean $assertionsDisabled;
    private static final zzala<Map<zzalk, zzakx>> bgP;
    private static final zzala<Map<zzalk, zzakx>> bgQ;
    private static final zzala<zzakx> bgR;
    private static final zzala<zzakx> bgS;
    private final zzalw aZR;
    private zzakz<Map<zzalk, zzakx>> bgT = new zzakz<>(null);
    private final zzanf bgU;
    private long bgV;
    private final zzakv bgz;

    static {
        $assertionsDisabled = !zzaky.class.desiredAssertionStatus();
        bgP = new zzala<Map<zzalk, zzakx>>() { // from class: com.google.android.gms.internal.zzaky.1
            @Override // com.google.android.gms.internal.zzala
            /* renamed from: zzcc */
            public boolean zzbs(Map<zzalk, zzakx> map) {
                zzakx zzakxVar = map.get(zzalk.bhG);
                return zzakxVar != null && zzakxVar.bgN;
            }
        };
        bgQ = new zzala<Map<zzalk, zzakx>>() { // from class: com.google.android.gms.internal.zzaky.2
            @Override // com.google.android.gms.internal.zzala
            /* renamed from: zzcc */
            public boolean zzbs(Map<zzalk, zzakx> map) {
                zzakx zzakxVar = map.get(zzalk.bhG);
                return zzakxVar != null && zzakxVar.bgO;
            }
        };
        bgR = new zzala<zzakx>() { // from class: com.google.android.gms.internal.zzaky.3
            @Override // com.google.android.gms.internal.zzala
            /* renamed from: zzc */
            public boolean zzbs(zzakx zzakxVar) {
                return !zzakxVar.bgO;
            }
        };
        bgS = new zzala<zzakx>() { // from class: com.google.android.gms.internal.zzaky.4
            @Override // com.google.android.gms.internal.zzala
            /* renamed from: zzc */
            public boolean zzbs(zzakx zzakxVar) {
                return !zzaky.bgR.zzbs(zzakxVar);
            }
        };
    }

    public zzaky(zzakv zzakvVar, zzalw zzalwVar, zzanf zzanfVar) {
        this.bgV = 0L;
        this.bgz = zzakvVar;
        this.aZR = zzalwVar;
        this.bgU = zzanfVar;
        zzcxb();
        for (zzakx zzakxVar : this.bgz.zzcrg()) {
            this.bgV = Math.max(zzakxVar.id + 1, this.bgV);
            zzb(zzakxVar);
        }
    }

    private static long zza(zzakq zzakqVar, long j) {
        return j - Math.min((long) Math.floor((1.0f - zzakqVar.zzcww()) * ((float) j)), zzakqVar.zzcwx());
    }

    private List<zzakx> zza(zzala<zzakx> zzalaVar) {
        ArrayList arrayList = new ArrayList();
        Iterator<Map.Entry<zzajq, Map<zzalk, zzakx>>> it = this.bgT.iterator();
        while (it.hasNext()) {
            for (zzakx zzakxVar : it.next().getValue().values()) {
                if (zzalaVar.zzbs(zzakxVar)) {
                    arrayList.add(zzakxVar);
                }
            }
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(zzakx zzakxVar) {
        zzb(zzakxVar);
        this.bgz.zza(zzakxVar);
    }

    private boolean zzae(zzajq zzajqVar) {
        return this.bgT.zza(zzajqVar, bgP) != null;
    }

    private Set<Long> zzaf(zzajq zzajqVar) {
        HashSet hashSet = new HashSet();
        Map<zzalk, zzakx> zzak = this.bgT.zzak(zzajqVar);
        if (zzak != null) {
            for (zzakx zzakxVar : zzak.values()) {
                if (!zzakxVar.bgL.zzcye()) {
                    hashSet.add(Long.valueOf(zzakxVar.id));
                }
            }
        }
        return hashSet;
    }

    private void zzb(zzakx zzakxVar) {
        HashMap hashMap;
        zzj(zzakxVar.bgL);
        Map<zzalk, zzakx> zzak = this.bgT.zzak(zzakxVar.bgL.zzcrc());
        if (zzak == null) {
            HashMap hashMap2 = new HashMap();
            this.bgT = this.bgT.zzb(zzakxVar.bgL.zzcrc(), (zzajq) hashMap2);
            hashMap = hashMap2;
        } else {
            hashMap = zzak;
        }
        zzakx zzakxVar2 = hashMap.get(zzakxVar.bgL.zzcyh());
        zzann.zzcx(zzakxVar2 == null || zzakxVar2.id == zzakxVar.id);
        hashMap.put(zzakxVar.bgL.zzcyh(), zzakxVar);
    }

    private void zzb(zzall zzallVar, boolean z) {
        zzakx zzakxVar;
        zzall zzk = zzk(zzallVar);
        zzakx zzl = zzl(zzk);
        long z2 = this.bgU.z();
        if (zzl != null) {
            zzakxVar = zzl.zzcm(z2).zzdc(z);
        } else if (!$assertionsDisabled && !z) {
            throw new AssertionError("If we're setting the query to inactive, we should already be tracking it!");
        } else {
            long j = this.bgV;
            this.bgV = 1 + j;
            zzakxVar = new zzakx(j, zzk, z2, false, z);
        }
        zza(zzakxVar);
    }

    private void zzcxb() {
        try {
            this.bgz.beginTransaction();
            this.bgz.zzca(this.bgU.z());
            this.bgz.setTransactionSuccessful();
        } finally {
            this.bgz.endTransaction();
        }
    }

    private static void zzj(zzall zzallVar) {
        zzann.zzb(!zzallVar.zzcye() || zzallVar.isDefault(), "Can't have tracked non-default query that loads all data");
    }

    private static zzall zzk(zzall zzallVar) {
        return zzallVar.zzcye() ? zzall.zzan(zzallVar.zzcrc()) : zzallVar;
    }

    public zzakw zza(zzakq zzakqVar) {
        List<zzakx> zza = zza(bgR);
        long zza2 = zza(zzakqVar, zza.size());
        zzakw zzakwVar = new zzakw();
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(new StringBuilder(80).append("Pruning old queries.  Prunable: ").append(zza.size()).append(" Count to prune: ").append(zza2).toString(), new Object[0]);
        }
        Collections.sort(zza, new Comparator<zzakx>() { // from class: com.google.android.gms.internal.zzaky.6
            @Override // java.util.Comparator
            /* renamed from: zza */
            public int compare(zzakx zzakxVar, zzakx zzakxVar2) {
                return zzann.zzj(zzakxVar.bgM, zzakxVar2.bgM);
            }
        });
        for (int i = 0; i < zza2; i++) {
            zzakx zzakxVar = zza.get(i);
            zzakwVar = zzakwVar.zzy(zzakxVar.bgL.zzcrc());
            zzm(zzakxVar.bgL);
        }
        int i2 = (int) zza2;
        zzakw zzakwVar2 = zzakwVar;
        while (true) {
            int i3 = i2;
            if (i3 >= zza.size()) {
                break;
            }
            zzakwVar2 = zzakwVar2.zzz(zza.get(i3).bgL.zzcrc());
            i2 = i3 + 1;
        }
        List<zzakx> zza3 = zza(bgS);
        if (this.aZR.zzcyu()) {
            this.aZR.zzi(new StringBuilder(31).append("Unprunable queries: ").append(zza3.size()).toString(), new Object[0]);
        }
        for (zzakx zzakxVar2 : zza3) {
            zzakwVar2 = zzakwVar2.zzz(zzakxVar2.bgL.zzcrc());
        }
        return zzakwVar2;
    }

    public void zzaa(zzajq zzajqVar) {
        this.bgT.zzai(zzajqVar).zza(new zzakz.zza<Map<zzalk, zzakx>, Void>() { // from class: com.google.android.gms.internal.zzaky.5
            @Override // com.google.android.gms.internal.zzakz.zza
            public Void zza(zzajq zzajqVar2, Map<zzalk, zzakx> map, Void r6) {
                for (Map.Entry<zzalk, zzakx> entry : map.entrySet()) {
                    zzakx value = entry.getValue();
                    if (!value.bgN) {
                        zzaky.this.zza(value.zzcxa());
                    }
                }
                return null;
            }
        });
    }

    public Set<zzalz> zzab(zzajq zzajqVar) {
        if ($assertionsDisabled || !zzo(zzall.zzan(zzajqVar))) {
            HashSet hashSet = new HashSet();
            Set<Long> zzaf = zzaf(zzajqVar);
            if (!zzaf.isEmpty()) {
                hashSet.addAll(this.bgz.zzh(zzaf));
            }
            Iterator<Map.Entry<zzalz, zzakz<Map<zzalk, zzakx>>>> it = this.bgT.zzai(zzajqVar).zzcxf().iterator();
            while (it.hasNext()) {
                Map.Entry<zzalz, zzakz<Map<zzalk, zzakx>>> next = it.next();
                zzalz key = next.getKey();
                zzakz<Map<zzalk, zzakx>> value = next.getValue();
                if (value.getValue() != null && bgP.zzbs(value.getValue())) {
                    hashSet.add(key);
                }
            }
            return hashSet;
        }
        throw new AssertionError("Path is fully complete.");
    }

    public void zzac(zzajq zzajqVar) {
        zzakx zzcxa;
        if (!zzae(zzajqVar)) {
            zzall zzan = zzall.zzan(zzajqVar);
            zzakx zzl = zzl(zzan);
            if (zzl == null) {
                long j = this.bgV;
                this.bgV = 1 + j;
                zzcxa = new zzakx(j, zzan, this.bgU.z(), true, false);
            } else if (!$assertionsDisabled && zzl.bgN) {
                throw new AssertionError("This should have been handled above!");
            } else {
                zzcxa = zzl.zzcxa();
            }
            zza(zzcxa);
        }
    }

    public boolean zzad(zzajq zzajqVar) {
        return this.bgT.zzb(zzajqVar, bgQ) != null;
    }

    public long zzcxc() {
        return zza(bgR).size();
    }

    public void zzg(zzall zzallVar) {
        zzb(zzallVar, true);
    }

    public void zzh(zzall zzallVar) {
        zzb(zzallVar, false);
    }

    public zzakx zzl(zzall zzallVar) {
        zzall zzk = zzk(zzallVar);
        Map<zzalk, zzakx> zzak = this.bgT.zzak(zzk.zzcrc());
        if (zzak != null) {
            return zzak.get(zzk.zzcyh());
        }
        return null;
    }

    public void zzm(zzall zzallVar) {
        zzall zzk = zzk(zzallVar);
        zzakx zzl = zzl(zzk);
        if ($assertionsDisabled || zzl != null) {
            this.bgz.zzbz(zzl.id);
            Map<zzalk, zzakx> zzak = this.bgT.zzak(zzk.zzcrc());
            zzak.remove(zzk.zzcyh());
            if (!zzak.isEmpty()) {
                return;
            }
            this.bgT = this.bgT.zzaj(zzk.zzcrc());
            return;
        }
        throw new AssertionError("Query must exist to be removed.");
    }

    public void zzn(zzall zzallVar) {
        zzakx zzl = zzl(zzk(zzallVar));
        if (zzl == null || zzl.bgN) {
            return;
        }
        zza(zzl.zzcxa());
    }

    public boolean zzo(zzall zzallVar) {
        if (zzae(zzallVar.zzcrc())) {
            return true;
        }
        if (zzallVar.zzcye()) {
            return false;
        }
        Map<zzalk, zzakx> zzak = this.bgT.zzak(zzallVar.zzcrc());
        return zzak != null && zzak.containsKey(zzallVar.zzcyh()) && zzak.get(zzallVar.zzcyh()).bgN;
    }
}
