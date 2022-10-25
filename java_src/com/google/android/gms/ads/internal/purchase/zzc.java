package com.google.android.gms.ads.internal.purchase;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.SystemClock;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.internal.zzik;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkw;
import com.google.android.gms.internal.zzkx;
import com.google.android.gms.internal.zzlb;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzc extends zzkw implements ServiceConnection {
    private Context mContext;
    private final Object zzako;
    private zzik zzbta;
    private boolean zzcff;
    private zzb zzcfg;
    private zzh zzcfh;
    private List<zzf> zzcfi;
    private zzk zzcfj;

    public zzc(Context context, zzik zzikVar, zzk zzkVar) {
        this(context, zzikVar, zzkVar, new zzb(context), zzh.zzq(context.getApplicationContext()));
    }

    zzc(Context context, zzik zzikVar, zzk zzkVar, zzb zzbVar, zzh zzhVar) {
        this.zzako = new Object();
        this.zzcff = false;
        this.zzcfi = null;
        this.mContext = context;
        this.zzbta = zzikVar;
        this.zzcfj = zzkVar;
        this.zzcfg = zzbVar;
        this.zzcfh = zzhVar;
        this.zzcfi = this.zzcfh.zzg(10L);
    }

    private void zze(long j) {
        do {
            if (!zzf(j)) {
                zzkx.v("Timeout waiting for pending transaction to be processed.");
            }
        } while (!this.zzcff);
    }

    private boolean zzf(long j) {
        long elapsedRealtime = 60000 - (SystemClock.elapsedRealtime() - j);
        if (elapsedRealtime <= 0) {
            return false;
        }
        try {
            this.zzako.wait(elapsedRealtime);
        } catch (InterruptedException e) {
            zzkx.zzdi("waitWithTimeout_lock interrupted");
        }
        return true;
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        synchronized (this.zzako) {
            this.zzcfg.zzav(iBinder);
            zzrr();
            this.zzcff = true;
            this.zzako.notify();
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
        zzkx.zzdh("In-app billing service disconnected.");
        this.zzcfg.destroy();
    }

    @Override // com.google.android.gms.internal.zzkw
    public void onStop() {
        synchronized (this.zzako) {
            com.google.android.gms.common.stats.zza.zzaxr().zza(this.mContext, this);
            this.zzcfg.destroy();
        }
    }

    protected void zza(final zzf zzfVar, String str, String str2) {
        final Intent intent = new Intent();
        zzu.zzha();
        intent.putExtra("RESPONSE_CODE", 0);
        zzu.zzha();
        intent.putExtra("INAPP_PURCHASE_DATA", str);
        zzu.zzha();
        intent.putExtra("INAPP_DATA_SIGNATURE", str2);
        zzlb.zzcvl.post(new Runnable() { // from class: com.google.android.gms.ads.internal.purchase.zzc.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    if (zzc.this.zzcfj.zza(zzfVar.zzcfu, -1, intent)) {
                        zzc.this.zzbta.zza(new zzg(zzc.this.mContext, zzfVar.zzcfv, true, -1, intent, zzfVar));
                    } else {
                        zzc.this.zzbta.zza(new zzg(zzc.this.mContext, zzfVar.zzcfv, false, -1, intent, zzfVar));
                    }
                } catch (RemoteException e) {
                    zzkx.zzdi("Fail to verify and dispatch pending transaction");
                }
            }
        });
    }

    @Override // com.google.android.gms.internal.zzkw
    public void zzfp() {
        synchronized (this.zzako) {
            Intent intent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
            intent.setPackage("com.android.vending");
            com.google.android.gms.common.stats.zza.zzaxr().zza(this.mContext, intent, this, 1);
            zze(SystemClock.elapsedRealtime());
            com.google.android.gms.common.stats.zza.zzaxr().zza(this.mContext, this);
            this.zzcfg.destroy();
        }
    }

    protected void zzrr() {
        if (this.zzcfi.isEmpty()) {
            return;
        }
        HashMap hashMap = new HashMap();
        for (zzf zzfVar : this.zzcfi) {
            hashMap.put(zzfVar.zzcfv, zzfVar);
        }
        String str = null;
        while (true) {
            Bundle zzm = this.zzcfg.zzm(this.mContext.getPackageName(), str);
            if (zzm == null || zzu.zzha().zzd(zzm) != 0) {
                break;
            }
            ArrayList<String> stringArrayList = zzm.getStringArrayList("INAPP_PURCHASE_ITEM_LIST");
            ArrayList<String> stringArrayList2 = zzm.getStringArrayList("INAPP_PURCHASE_DATA_LIST");
            ArrayList<String> stringArrayList3 = zzm.getStringArrayList("INAPP_DATA_SIGNATURE_LIST");
            String string = zzm.getString("INAPP_CONTINUATION_TOKEN");
            int i = 0;
            while (true) {
                int i2 = i;
                if (i2 >= stringArrayList.size()) {
                    break;
                }
                if (hashMap.containsKey(stringArrayList.get(i2))) {
                    String str2 = stringArrayList.get(i2);
                    String str3 = stringArrayList2.get(i2);
                    String str4 = stringArrayList3.get(i2);
                    zzf zzfVar2 = (zzf) hashMap.get(str2);
                    if (zzfVar2.zzcfu.equals(zzu.zzha().zzcg(str3))) {
                        zza(zzfVar2, str3, str4);
                        hashMap.remove(str2);
                    }
                }
                i = i2 + 1;
            }
            if (string == null || hashMap.isEmpty()) {
                break;
            }
            str = string;
        }
        for (String str5 : hashMap.keySet()) {
            this.zzcfh.zza((zzf) hashMap.get(str5));
        }
    }
}
