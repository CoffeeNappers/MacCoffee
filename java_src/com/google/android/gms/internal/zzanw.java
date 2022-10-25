package com.google.android.gms.internal;

import android.content.Context;
import android.util.Log;
import com.google.android.gms.internal.zzaob;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
/* loaded from: classes2.dex */
public class zzanw implements Runnable {
    public final zzaoa bll;
    public final zzanx bls;
    public final zzanx blt;
    public final zzanx blu;
    public final Context mContext;

    public zzanw(Context context, zzanx zzanxVar, zzanx zzanxVar2, zzanx zzanxVar3, zzaoa zzaoaVar) {
        this.mContext = context;
        this.bls = zzanxVar;
        this.blt = zzanxVar2;
        this.blu = zzanxVar3;
        this.bll = zzaoaVar;
    }

    private zzaob.zza zza(zzanx zzanxVar) {
        zzaob.zza zzaVar = new zzaob.zza();
        if (zzanxVar.V() != null) {
            Map<String, Map<String, byte[]>> V = zzanxVar.V();
            ArrayList arrayList = new ArrayList();
            for (String str : V.keySet()) {
                ArrayList arrayList2 = new ArrayList();
                Map<String, byte[]> map = V.get(str);
                for (String str2 : map.keySet()) {
                    zzaob.zzb zzbVar = new zzaob.zzb();
                    zzbVar.zzcb = str2;
                    zzbVar.blE = map.get(str2);
                    arrayList2.add(zzbVar);
                }
                zzaob.zzd zzdVar = new zzaob.zzd();
                zzdVar.EY = str;
                zzdVar.blI = (zzaob.zzb[]) arrayList2.toArray(new zzaob.zzb[arrayList2.size()]);
                arrayList.add(zzdVar);
            }
            zzaVar.blC = (zzaob.zzd[]) arrayList.toArray(new zzaob.zzd[arrayList.size()]);
        }
        zzaVar.timestamp = zzanxVar.getTimestamp();
        return zzaVar;
    }

    @Override // java.lang.Runnable
    public void run() {
        zzaob.zze zzeVar = new zzaob.zze();
        if (this.bls != null) {
            zzeVar.blJ = zza(this.bls);
        }
        if (this.blt != null) {
            zzeVar.blK = zza(this.blt);
        }
        if (this.blu != null) {
            zzeVar.blL = zza(this.blu);
        }
        if (this.bll != null) {
            zzaob.zzc zzcVar = new zzaob.zzc();
            zzcVar.blF = this.bll.getLastFetchStatus();
            zzcVar.blG = this.bll.isDeveloperModeEnabled();
            zzeVar.blM = zzcVar;
        }
        if (this.bll != null && this.bll.Y() != null) {
            ArrayList arrayList = new ArrayList();
            Map<String, zzanv> Y = this.bll.Y();
            for (String str : Y.keySet()) {
                if (Y.get(str) != null) {
                    zzaob.zzf zzfVar = new zzaob.zzf();
                    zzfVar.EY = str;
                    zzfVar.blP = Y.get(str).U();
                    zzfVar.resourceId = Y.get(str).T();
                    arrayList.add(zzfVar);
                }
            }
            zzeVar.blN = (zzaob.zzf[]) arrayList.toArray(new zzaob.zzf[arrayList.size()]);
        }
        byte[] zzf = zzasa.zzf(zzeVar);
        try {
            FileOutputStream openFileOutput = this.mContext.openFileOutput("persisted_config", 0);
            openFileOutput.write(zzf);
            openFileOutput.close();
        } catch (IOException e) {
            Log.e("AsyncPersisterTask", "Could not persist config.", e);
        }
    }
}
