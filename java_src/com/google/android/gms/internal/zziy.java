package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.internal.zzit;
import com.google.android.gms.internal.zziu;
import com.google.android.gms.internal.zzko;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
@zzji
/* loaded from: classes.dex */
public class zziy extends zzit {
    private final zzdz zzalt;
    private zzgz zzamf;
    private final zzmd zzbnz;
    private zzgq zzbwc;
    zzgo zzchc;
    protected zzgu zzchd;
    private boolean zzche;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zziy(Context context, zzko.zza zzaVar, zzgz zzgzVar, zziu.zza zzaVar2, zzdz zzdzVar, zzmd zzmdVar) {
        super(context, zzaVar, zzaVar2);
        this.zzamf = zzgzVar;
        this.zzbwc = zzaVar.zzcsk;
        this.zzalt = zzdzVar;
        this.zzbnz = zzmdVar;
    }

    private static String zza(zzgu zzguVar) {
        String str = zzguVar.zzbwm.zzbuv;
        int zzar = zzar(zzguVar.zzbwl);
        return new StringBuilder(String.valueOf(str).length() + 33).append(str).append(".").append(zzar).append(".").append(zzguVar.zzbwr).toString();
    }

    private static int zzar(int i) {
        switch (i) {
            case -1:
                return 4;
            case 0:
                return 0;
            case 1:
                return 1;
            case 2:
            default:
                return 6;
            case 3:
                return 2;
            case 4:
                return 3;
            case 5:
                return 5;
        }
    }

    private static String zzg(List<zzgu> list) {
        if (list == null) {
            return "".toString();
        }
        String str = "";
        for (zzgu zzguVar : list) {
            if (zzguVar != null && zzguVar.zzbwm != null && !TextUtils.isEmpty(zzguVar.zzbwm.zzbuv)) {
                String valueOf = String.valueOf(str);
                String valueOf2 = String.valueOf(zza(zzguVar));
                str = new StringBuilder(String.valueOf(valueOf).length() + 1 + String.valueOf(valueOf2).length()).append(valueOf).append(valueOf2).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).toString();
            }
        }
        return str.substring(0, Math.max(0, str.length() - 1));
    }

    private void zzsg() throws zzit.zza {
        final CountDownLatch countDownLatch = new CountDownLatch(1);
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.internal.zziy.1
            @Override // java.lang.Runnable
            public void run() {
                synchronized (zziy.this.zzcgi) {
                    zziy.this.zzche = com.google.android.gms.ads.internal.zzn.zza(zziy.this.zzbnz, zziy.this.zzchd, countDownLatch);
                }
            }
        });
        try {
            countDownLatch.await(10L, TimeUnit.SECONDS);
            synchronized (this.zzcgi) {
                if (!this.zzche) {
                    throw new zzit.zza("View could not be prepared", 0);
                }
                if (this.zzbnz.isDestroyed()) {
                    throw new zzit.zza("Assets not loaded, web view is destroyed", 0);
                }
            }
        } catch (InterruptedException e) {
            String valueOf = String.valueOf(e);
            throw new zzit.zza(new StringBuilder(String.valueOf(valueOf).length() + 38).append("Interrupted while waiting for latch : ").append(valueOf).toString(), 0);
        }
    }

    @Override // com.google.android.gms.internal.zzit, com.google.android.gms.internal.zzkw
    public void onStop() {
        synchronized (this.zzcgi) {
            super.onStop();
            if (this.zzchc != null) {
                this.zzchc.cancel();
            }
        }
    }

    @Override // com.google.android.gms.internal.zzit
    protected zzko zzap(int i) {
        AdRequestInfoParcel adRequestInfoParcel = this.zzcgf.zzcmx;
        return new zzko(adRequestInfoParcel.zzcju, this.zzbnz, this.zzcgg.zzbvk, i, this.zzcgg.zzbvl, this.zzcgg.zzcld, this.zzcgg.orientation, this.zzcgg.zzbvq, adRequestInfoParcel.zzcjx, this.zzcgg.zzclb, this.zzchd != null ? this.zzchd.zzbwm : null, this.zzchd != null ? this.zzchd.zzbwn : null, this.zzchd != null ? this.zzchd.zzbwo : AdMobAdapter.class.getName(), this.zzbwc, this.zzchd != null ? this.zzchd.zzbwp : null, this.zzcgg.zzclc, this.zzcgf.zzarm, this.zzcgg.zzcla, this.zzcgf.zzcso, this.zzcgg.zzclf, this.zzcgg.zzclg, this.zzcgf.zzcsi, null, this.zzcgg.zzclq, this.zzcgg.zzclr, this.zzcgg.zzcls, this.zzbwc != null ? this.zzbwc.zzbvv : false, this.zzcgg.zzclu, this.zzchc != null ? zzg(this.zzchc.zzoe()) : null, this.zzcgg.zzbvn, this.zzcgg.zzclx);
    }

    @Override // com.google.android.gms.internal.zzit
    protected void zzh(long j) throws zzit.zza {
        Bundle bundle;
        synchronized (this.zzcgi) {
            this.zzchc = zzi(j);
        }
        ArrayList arrayList = new ArrayList(this.zzbwc.zzbvi);
        Bundle bundle2 = this.zzcgf.zzcmx.zzcju.zzayv;
        if ((bundle2 == null || (bundle = bundle2.getBundle("com.google.ads.mediation.admob.AdMobAdapter")) == null) ? false : bundle.getBoolean("_skipMediation")) {
            ListIterator listIterator = arrayList.listIterator();
            while (listIterator.hasNext()) {
                if (!((zzgp) listIterator.next()).zzbuu.contains("com.google.ads.mediation.admob.AdMobAdapter")) {
                    listIterator.remove();
                }
            }
        }
        this.zzchd = this.zzchc.zzd(arrayList);
        switch (this.zzchd.zzbwl) {
            case 0:
                if (this.zzchd.zzbwm == null || this.zzchd.zzbwm.zzbvd == null) {
                    return;
                }
                zzsg();
                return;
            case 1:
                throw new zzit.zza("No fill from any mediation ad networks.", 3);
            default:
                throw new zzit.zza(new StringBuilder(40).append("Unexpected mediation result: ").append(this.zzchd.zzbwl).toString(), 0);
        }
    }

    zzgo zzi(long j) {
        return this.zzbwc.zzbvt != -1 ? new zzgw(this.mContext, this.zzcgf.zzcmx, this.zzamf, this.zzbwc, this.zzcgg.zzazt, this.zzcgg.zzazv, j, zzdr.zzbhk.get().longValue(), 2) : new zzgx(this.mContext, this.zzcgf.zzcmx, this.zzamf, this.zzbwc, this.zzcgg.zzazt, this.zzcgg.zzazv, j, zzdr.zzbhk.get().longValue(), this.zzalt);
    }
}
