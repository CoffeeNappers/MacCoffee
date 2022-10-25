package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
@zzji
/* loaded from: classes.dex */
public class zzgw implements zzgo {
    private final Context mContext;
    private final zzgz zzamf;
    private final boolean zzasz;
    private final zzgq zzbwc;
    private final boolean zzbwe;
    private final AdRequestInfoParcel zzbws;
    private final long zzbwt;
    private final long zzbwu;
    private final int zzbwv;
    private final Object zzako = new Object();
    private boolean zzbww = false;
    private final Map<zzlt<zzgu>, zzgt> zzbwx = new HashMap();
    private List<zzgu> zzbwy = new ArrayList();

    public zzgw(Context context, AdRequestInfoParcel adRequestInfoParcel, zzgz zzgzVar, zzgq zzgqVar, boolean z, boolean z2, long j, long j2, int i) {
        this.mContext = context;
        this.zzbws = adRequestInfoParcel;
        this.zzamf = zzgzVar;
        this.zzbwc = zzgqVar;
        this.zzasz = z;
        this.zzbwe = z2;
        this.zzbwt = j;
        this.zzbwu = j2;
        this.zzbwv = i;
    }

    private void zza(final zzlt<zzgu> zzltVar) {
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzgw.2
            @Override // java.lang.Runnable
            public void run() {
                for (zzlt zzltVar2 : zzgw.this.zzbwx.keySet()) {
                    if (zzltVar2 != zzltVar) {
                        ((zzgt) zzgw.this.zzbwx.get(zzltVar2)).cancel();
                    }
                }
            }
        });
    }

    private zzgu zze(List<zzlt<zzgu>> list) {
        synchronized (this.zzako) {
            if (this.zzbww) {
                return new zzgu(-1);
            }
            for (zzlt<zzgu> zzltVar : list) {
                try {
                    zzgu zzguVar = zzltVar.get();
                    this.zzbwy.add(zzguVar);
                    if (zzguVar != null && zzguVar.zzbwl == 0) {
                        zza(zzltVar);
                        return zzguVar;
                    }
                } catch (InterruptedException | ExecutionException e) {
                    zzkx.zzc("Exception while processing an adapter; continuing with other adapters", e);
                }
            }
            zza((zzlt<zzgu>) null);
            return new zzgu(1);
        }
    }

    private zzgu zzf(List<zzlt<zzgu>> list) {
        zzgu zzguVar;
        zzgu zzguVar2;
        zzlt<zzgu> zzltVar;
        int i;
        zzhc zzhcVar;
        synchronized (this.zzako) {
            if (this.zzbww) {
                return new zzgu(-1);
            }
            int i2 = -1;
            zzlt<zzgu> zzltVar2 = null;
            zzgu zzguVar3 = null;
            long j = this.zzbwc.zzbvu != -1 ? this.zzbwc.zzbvu : 10000L;
            Iterator<zzlt<zzgu>> it = list.iterator();
            while (true) {
                long j2 = j;
                if (!it.hasNext()) {
                    break;
                }
                zzlt<zzgu> next = it.next();
                long currentTimeMillis = com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis();
                if (j2 == 0) {
                    try {
                        try {
                        } finally {
                            Math.max(j2 - (com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis() - currentTimeMillis), 0L);
                        }
                    } catch (RemoteException | InterruptedException | ExecutionException | TimeoutException e) {
                        zzkx.zzc("Exception while processing an adapter; continuing with other adapters", e);
                    }
                    if (next.isDone()) {
                        zzguVar = next.get();
                        this.zzbwy.add(zzguVar);
                        if (zzguVar != null || zzguVar.zzbwl != 0 || (zzhcVar = zzguVar.zzbwq) == null || zzhcVar.zzok() <= i2) {
                            zzguVar2 = zzguVar3;
                            zzltVar = zzltVar2;
                            i = i2;
                        } else {
                            i = zzhcVar.zzok();
                            zzgu zzguVar4 = zzguVar;
                            zzltVar = next;
                            zzguVar2 = zzguVar4;
                        }
                        zzltVar2 = zzltVar;
                        zzgu zzguVar5 = zzguVar2;
                        j = Math.max(j2 - (com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis() - currentTimeMillis), 0L);
                        i2 = i;
                        zzguVar3 = zzguVar5;
                    }
                }
                zzguVar = next.get(j2, TimeUnit.MILLISECONDS);
                this.zzbwy.add(zzguVar);
                if (zzguVar != null) {
                }
                zzguVar2 = zzguVar3;
                zzltVar = zzltVar2;
                i = i2;
                zzltVar2 = zzltVar;
                zzgu zzguVar52 = zzguVar2;
                j = Math.max(j2 - (com.google.android.gms.ads.internal.zzu.zzgs().currentTimeMillis() - currentTimeMillis), 0L);
                i2 = i;
                zzguVar3 = zzguVar52;
            }
            zza(zzltVar2);
            return zzguVar3 == null ? new zzgu(1) : zzguVar3;
        }
    }

    @Override // com.google.android.gms.internal.zzgo
    public void cancel() {
        synchronized (this.zzako) {
            this.zzbww = true;
            for (zzgt zzgtVar : this.zzbwx.values()) {
                zzgtVar.cancel();
            }
        }
    }

    @Override // com.google.android.gms.internal.zzgo
    public zzgu zzd(List<zzgp> list) {
        zzkx.zzdg("Starting mediation.");
        ExecutorService newCachedThreadPool = Executors.newCachedThreadPool();
        ArrayList arrayList = new ArrayList();
        for (zzgp zzgpVar : list) {
            String valueOf = String.valueOf(zzgpVar.zzbut);
            zzkx.zzdh(valueOf.length() != 0 ? "Trying mediation network: ".concat(valueOf) : new String("Trying mediation network: "));
            for (String str : zzgpVar.zzbuu) {
                final zzgt zzgtVar = new zzgt(this.mContext, str, this.zzamf, this.zzbwc, zzgpVar, this.zzbws.zzcju, this.zzbws.zzarm, this.zzbws.zzari, this.zzasz, this.zzbwe, this.zzbws.zzasa, this.zzbws.zzase);
                zzlt<zzgu> zza = zzla.zza(newCachedThreadPool, new Callable<zzgu>() { // from class: com.google.android.gms.internal.zzgw.1
                    @Override // java.util.concurrent.Callable
                    /* renamed from: zzol */
                    public zzgu call() throws Exception {
                        synchronized (zzgw.this.zzako) {
                            if (zzgw.this.zzbww) {
                                return null;
                            }
                            return zzgtVar.zza(zzgw.this.zzbwt, zzgw.this.zzbwu);
                        }
                    }
                });
                this.zzbwx.put(zza, zzgtVar);
                arrayList.add(zza);
            }
        }
        switch (this.zzbwv) {
            case 2:
                return zzf(arrayList);
            default:
                return zze(arrayList);
        }
    }

    @Override // com.google.android.gms.internal.zzgo
    public List<zzgu> zzoe() {
        return this.zzbwy;
    }
}
