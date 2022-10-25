package com.google.android.gms.ads.internal.purchase;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.zzu;
import com.google.android.gms.internal.zzif;
import com.google.android.gms.internal.zzih;
import com.google.android.gms.internal.zzji;
import com.google.android.gms.internal.zzkx;
@zzji
/* loaded from: classes.dex */
public class zze extends zzih.zza implements ServiceConnection {
    private final Activity mActivity;
    private zzb zzcfg;
    zzh zzcfh;
    private zzk zzcfj;
    private Context zzcfo;
    private zzif zzcfp;
    private zzf zzcfq;
    private zzj zzcfr;
    private String zzcfs = null;

    public zze(Activity activity) {
        this.mActivity = activity;
        this.zzcfh = zzh.zzq(this.mActivity.getApplicationContext());
    }

    @Override // com.google.android.gms.internal.zzih
    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 1001) {
            boolean z = false;
            try {
                int zzd = zzu.zzha().zzd(intent);
                if (i2 == -1) {
                    zzu.zzha();
                    if (zzd == 0) {
                        if (this.zzcfj.zza(this.zzcfs, i2, intent)) {
                            z = true;
                        }
                        this.zzcfp.recordPlayBillingResolution(zzd);
                        this.mActivity.finish();
                        zza(this.zzcfp.getProductId(), z, i2, intent);
                    }
                }
                this.zzcfh.zza(this.zzcfq);
                this.zzcfp.recordPlayBillingResolution(zzd);
                this.mActivity.finish();
                zza(this.zzcfp.getProductId(), z, i2, intent);
            } catch (RemoteException e) {
                zzkx.zzdi("Fail to process purchase result.");
                this.mActivity.finish();
            } finally {
                this.zzcfs = null;
            }
        }
    }

    @Override // com.google.android.gms.internal.zzih
    public void onCreate() {
        GInAppPurchaseManagerInfoParcel zzc = GInAppPurchaseManagerInfoParcel.zzc(this.mActivity.getIntent());
        this.zzcfr = zzc.zzcfc;
        this.zzcfj = zzc.zzasf;
        this.zzcfp = zzc.zzcfa;
        this.zzcfg = new zzb(this.mActivity.getApplicationContext());
        this.zzcfo = zzc.zzcfb;
        if (this.mActivity.getResources().getConfiguration().orientation == 2) {
            this.mActivity.setRequestedOrientation(zzu.zzgo().zzvw());
        } else {
            this.mActivity.setRequestedOrientation(zzu.zzgo().zzvx());
        }
        Intent intent = new Intent("com.android.vending.billing.InAppBillingService.BIND");
        intent.setPackage("com.android.vending");
        com.google.android.gms.common.stats.zza.zzaxr().zza(this.mActivity, intent, this, 1);
    }

    @Override // com.google.android.gms.internal.zzih
    public void onDestroy() {
        com.google.android.gms.common.stats.zza.zzaxr().zza(this.mActivity, this);
        this.zzcfg.destroy();
    }

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        this.zzcfg.zzav(iBinder);
        try {
            this.zzcfs = this.zzcfj.zzrv();
            Bundle zzb = this.zzcfg.zzb(this.mActivity.getPackageName(), this.zzcfp.getProductId(), this.zzcfs);
            PendingIntent pendingIntent = (PendingIntent) zzb.getParcelable("BUY_INTENT");
            if (pendingIntent == null) {
                int zzd = zzu.zzha().zzd(zzb);
                this.zzcfp.recordPlayBillingResolution(zzd);
                zza(this.zzcfp.getProductId(), false, zzd, null);
                this.mActivity.finish();
            } else {
                this.zzcfq = new zzf(this.zzcfp.getProductId(), this.zzcfs);
                this.zzcfh.zzb(this.zzcfq);
                Integer num = 0;
                Integer num2 = 0;
                Integer num3 = 0;
                this.mActivity.startIntentSenderForResult(pendingIntent.getIntentSender(), 1001, new Intent(), num.intValue(), num2.intValue(), num3.intValue());
            }
        } catch (IntentSender.SendIntentException | RemoteException e) {
            zzkx.zzc("Error when connecting in-app billing service", e);
            this.mActivity.finish();
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName componentName) {
        zzkx.zzdh("In-app billing service disconnected.");
        this.zzcfg.destroy();
    }

    protected void zza(String str, boolean z, int i, Intent intent) {
        if (this.zzcfr != null) {
            this.zzcfr.zza(str, z, i, intent, this.zzcfq);
        }
    }
}
