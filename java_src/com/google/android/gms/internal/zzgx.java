package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import java.util.ArrayList;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzgx implements zzgo {
    private final Context mContext;
    private final zzdz zzalt;
    private final zzgz zzamf;
    private final boolean zzasz;
    private final zzgq zzbwc;
    private final boolean zzbwe;
    private final AdRequestInfoParcel zzbws;
    private final long zzbwt;
    private final long zzbwu;
    private zzgt zzbxc;
    private final Object zzako = new Object();
    private boolean zzbww = false;
    private List<zzgu> zzbwy = new ArrayList();

    public zzgx(Context context, AdRequestInfoParcel adRequestInfoParcel, zzgz zzgzVar, zzgq zzgqVar, boolean z, boolean z2, long j, long j2, zzdz zzdzVar) {
        this.mContext = context;
        this.zzbws = adRequestInfoParcel;
        this.zzamf = zzgzVar;
        this.zzbwc = zzgqVar;
        this.zzasz = z;
        this.zzbwe = z2;
        this.zzbwt = j;
        this.zzbwu = j2;
        this.zzalt = zzdzVar;
    }

    @Override // com.google.android.gms.internal.zzgo
    public void cancel() {
        synchronized (this.zzako) {
            this.zzbww = true;
            if (this.zzbxc != null) {
                this.zzbxc.cancel();
            }
        }
    }

    @Override // com.google.android.gms.internal.zzgo
    public zzgu zzd(List<zzgp> list) {
        zzkx.zzdg("Starting mediation.");
        ArrayList arrayList = new ArrayList();
        zzdx zzlz = this.zzalt.zzlz();
        for (zzgp zzgpVar : list) {
            String valueOf = String.valueOf(zzgpVar.zzbut);
            zzkx.zzdh(valueOf.length() != 0 ? "Trying mediation network: ".concat(valueOf) : new String("Trying mediation network: "));
            for (String str : zzgpVar.zzbuu) {
                zzdx zzlz2 = this.zzalt.zzlz();
                synchronized (this.zzako) {
                    if (this.zzbww) {
                        return new zzgu(-1);
                    }
                    this.zzbxc = new zzgt(this.mContext, str, this.zzamf, this.zzbwc, zzgpVar, this.zzbws.zzcju, this.zzbws.zzarm, this.zzbws.zzari, this.zzasz, this.zzbwe, this.zzbws.zzasa, this.zzbws.zzase);
                    final zzgu zza = this.zzbxc.zza(this.zzbwt, this.zzbwu);
                    this.zzbwy.add(zza);
                    if (zza.zzbwl == 0) {
                        zzkx.zzdg("Adapter succeeded.");
                        this.zzalt.zzg("mediation_network_succeed", str);
                        if (!arrayList.isEmpty()) {
                            this.zzalt.zzg("mediation_networks_fail", TextUtils.join(",", arrayList));
                        }
                        this.zzalt.zza(zzlz2, "mls");
                        this.zzalt.zza(zzlz, "ttm");
                        return zza;
                    }
                    arrayList.add(str);
                    this.zzalt.zza(zzlz2, "mlf");
                    if (zza.zzbwn != null) {
                        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zzgx.1
                            @Override // java.lang.Runnable
                            public void run() {
                                try {
                                    zza.zzbwn.destroy();
                                } catch (RemoteException e) {
                                    zzkx.zzc("Could not destroy mediation adapter.", e);
                                }
                            }
                        });
                    }
                }
            }
        }
        if (!arrayList.isEmpty()) {
            this.zzalt.zzg("mediation_networks_fail", TextUtils.join(",", arrayList));
        }
        return new zzgu(1);
    }

    @Override // com.google.android.gms.internal.zzgo
    public List<zzgu> zzoe() {
        return this.zzbwy;
    }
}
