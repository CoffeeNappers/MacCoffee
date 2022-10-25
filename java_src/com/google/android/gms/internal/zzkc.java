package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.internal.zzkd;
import com.google.android.gms.internal.zzko;
@zzji
/* loaded from: classes.dex */
public class zzkc extends zzkw implements zzke, zzkh {
    private final Context mContext;
    private final String zzbwa;
    private final zzko.zza zzcgf;
    private final zzkj zzcre;
    private final zzkh zzcrf;
    private final String zzcrg;
    private final zzgp zzcrh;
    private final long zzcri;
    private zzkd zzcrk;
    private int zzcrj = 0;
    private int zzcgw = 3;
    private final Object zzako = new Object();

    public zzkc(Context context, String str, String str2, zzgp zzgpVar, zzko.zza zzaVar, zzkj zzkjVar, zzkh zzkhVar, long j) {
        this.mContext = context;
        this.zzbwa = str;
        this.zzcrg = str2;
        this.zzcrh = zzgpVar;
        this.zzcgf = zzaVar;
        this.zzcre = zzkjVar;
        this.zzcrf = zzkhVar;
        this.zzcri = j;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zza(AdRequestParcel adRequestParcel, zzha zzhaVar) {
        this.zzcre.zzud().zza((zzkh) this);
        try {
            if ("com.google.ads.mediation.admob.AdMobAdapter".equals(this.zzbwa)) {
                zzhaVar.zza(adRequestParcel, this.zzcrg, this.zzcrh.zzbus);
            } else {
                zzhaVar.zzc(adRequestParcel, this.zzcrg);
            }
        } catch (RemoteException e) {
            zzkx.zzc("Fail to load ad from adapter.", e);
            zza(this.zzbwa, 0);
        }
    }

    private void zzk(long j) {
        while (true) {
            synchronized (this.zzako) {
                if (this.zzcrj != 0) {
                    this.zzcrk = new zzkd.zza().zzl(com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime() - j).zzbc(1 == this.zzcrj ? 6 : this.zzcgw).zzcr(this.zzbwa).zzcs(this.zzcrh.zzbuv).zztz();
                    return;
                } else if (!zzf(j)) {
                    this.zzcrk = new zzkd.zza().zzbc(this.zzcgw).zzl(com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime() - j).zzcr(this.zzbwa).zzcs(this.zzcrh.zzbuv).zztz();
                    return;
                }
            }
        }
    }

    @Override // com.google.android.gms.internal.zzkw
    public void onStop() {
    }

    @Override // com.google.android.gms.internal.zzkh
    public void zza(String str, int i) {
        synchronized (this.zzako) {
            this.zzcrj = 2;
            this.zzcgw = i;
            this.zzako.notify();
        }
    }

    @Override // com.google.android.gms.internal.zzke
    public void zzbb(int i) {
        zza(this.zzbwa, 0);
    }

    @Override // com.google.android.gms.internal.zzkh
    public void zzcq(String str) {
        synchronized (this.zzako) {
            this.zzcrj = 1;
            this.zzako.notify();
        }
    }

    protected boolean zzf(long j) {
        long elapsedRealtime = this.zzcri - (com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime() - j);
        if (elapsedRealtime <= 0) {
            this.zzcgw = 4;
            return false;
        }
        try {
            this.zzako.wait(elapsedRealtime);
            return true;
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            this.zzcgw = 5;
            return false;
        }
    }

    @Override // com.google.android.gms.internal.zzkw
    public void zzfp() {
        if (this.zzcre == null || this.zzcre.zzud() == null || this.zzcre.zzuc() == null) {
            return;
        }
        final zzkg zzud = this.zzcre.zzud();
        zzud.zza((zzkh) null);
        zzud.zza((zzke) this);
        final AdRequestParcel adRequestParcel = this.zzcgf.zzcmx.zzcju;
        final zzha zzuc = this.zzcre.zzuc();
        try {
            if (zzuc.isInitialized()) {
                com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzkc.1
                    @Override // java.lang.Runnable
                    public void run() {
                        zzkc.this.zza(adRequestParcel, zzuc);
                    }
                });
            } else {
                com.google.android.gms.ads.internal.util.client.zza.zzcxr.post(new Runnable() { // from class: com.google.android.gms.internal.zzkc.2
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            zzuc.zza(com.google.android.gms.dynamic.zze.zzac(zzkc.this.mContext), adRequestParcel, (String) null, zzud, zzkc.this.zzcrg);
                        } catch (RemoteException e) {
                            String valueOf = String.valueOf(zzkc.this.zzbwa);
                            zzkx.zzc(valueOf.length() != 0 ? "Fail to initialize adapter ".concat(valueOf) : new String("Fail to initialize adapter "), e);
                            zzkc.this.zza(zzkc.this.zzbwa, 0);
                        }
                    }
                });
            }
        } catch (RemoteException e) {
            zzkx.zzc("Fail to check if adapter is initialized.", e);
            zza(this.zzbwa, 0);
        }
        zzk(com.google.android.gms.ads.internal.zzu.zzgs().elapsedRealtime());
        zzud.zza((zzkh) null);
        zzud.zza((zzke) null);
        if (this.zzcrj == 1) {
            this.zzcrf.zzcq(this.zzbwa);
        } else {
            this.zzcrf.zza(this.zzbwa, this.zzcgw);
        }
    }

    public zzkd zztw() {
        zzkd zzkdVar;
        synchronized (this.zzako) {
            zzkdVar = this.zzcrk;
        }
        return zzkdVar;
    }

    public zzgp zztx() {
        return this.zzcrh;
    }

    @Override // com.google.android.gms.internal.zzke
    public void zzty() {
        zza(this.zzcgf.zzcmx.zzcju, this.zzcre.zzuc());
    }
}
