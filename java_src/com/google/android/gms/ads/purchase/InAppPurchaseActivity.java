package com.google.android.gms.ads.purchase;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.ads.internal.client.zzm;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzih;
/* loaded from: classes.dex */
public class InAppPurchaseActivity extends Activity {
    public static final String CLASS_NAME = "com.google.android.gms.ads.purchase.InAppPurchaseActivity";
    public static final String SIMPLE_CLASS_NAME = "InAppPurchaseActivity";
    private zzih Y;

    @Override // android.app.Activity
    protected void onActivityResult(int i, int i2, Intent intent) {
        try {
            if (this.Y != null) {
                this.Y.onActivityResult(i, i2, intent);
            }
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onActivityResult to in-app purchase manager:", e);
        }
        super.onActivityResult(i, i2, intent);
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        this.Y = zzm.zzks().zzb(this);
        if (this.Y == null) {
            zzb.zzdi("Could not create in-app purchase manager.");
            finish();
            return;
        }
        try {
            this.Y.onCreate();
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onCreate to in-app purchase manager:", e);
            finish();
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        try {
            if (this.Y != null) {
                this.Y.onDestroy();
            }
        } catch (RemoteException e) {
            zzb.zzc("Could not forward onDestroy to in-app purchase manager:", e);
        }
        super.onDestroy();
    }
}
