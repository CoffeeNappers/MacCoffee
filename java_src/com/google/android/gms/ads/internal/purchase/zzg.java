package com.google.android.gms.ads.internal.purchase;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.IBinder;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.internal.zzij;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
@zzji
/* loaded from: classes.dex */
public final class zzg extends zzij.zza implements ServiceConnection {
    private Context mContext;
    private int mResultCode;
    zzb zzcfg;
    private String zzcfm;
    private zzf zzcfq;
    private boolean zzcfw;
    private Intent zzcfx;

    public zzg(Context context, String str, boolean z, int i, Intent intent, zzf zzfVar) {
        this.zzcfw = false;
        this.zzcfm = str;
        this.mResultCode = i;
        this.zzcfx = intent;
        this.zzcfw = z;
        this.mContext = context;
        this.zzcfq = zzfVar;
    }

    @Override // com.google.android.gms.internal.zzij
    public void finishPurchase() {
        int zzd = zzu.zzha().zzd(this.zzcfx);
        if (this.mResultCode == -1 && zzd == 0) {
            this.zzcfg = new zzb(this.mContext);
            Intent intent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
            intent.setPackage("com.android.vending");
            com.google.android.gms.common.stats.zza.zzaxr().zza(this.mContext, intent, this, 1);
        }
    }

    @Override // com.google.android.gms.internal.zzij
    public String getProductId() {
        return this.zzcfm;
    }

    @Override // com.google.android.gms.internal.zzij
    public Intent getPurchaseData() {
        return this.zzcfx;
    }

    @Override // com.google.android.gms.internal.zzij
    public int getResultCode() {
        return this.mResultCode;
    }

    @Override // com.google.android.gms.internal.zzij
    public boolean isVerified() {
        return this.zzcfw;
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        zzkx.zzdh("In-app billing service connected.");
        this.zzcfg.zzav(iBinder);
        String zzch = zzu.zzha().zzch(zzu.zzha().zze(this.zzcfx));
        if (zzch == null) {
            return;
        }
        if (this.zzcfg.zzl(this.mContext.getPackageName(), zzch) == 0) {
            zzh.zzq(this.mContext).zza(this.zzcfq);
        }
        com.google.android.gms.common.stats.zza.zzaxr().zza(this.mContext, this);
        this.zzcfg.destroy();
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
        zzkx.zzdh("In-app billing service disconnected.");
        this.zzcfg.destroy();
    }
}
