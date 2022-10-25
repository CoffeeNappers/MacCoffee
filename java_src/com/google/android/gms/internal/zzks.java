package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Bundle;
import com.google.android.gms.ads.AdActivity;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
@zzji
/* loaded from: classes.dex */
public class zzks {
    final String zzctq;
    long zzcuj = -1;
    long zzcuk = -1;
    int zzcul = -1;
    int zzcui = -1;
    private final Object zzako = new Object();
    int zzcum = 0;
    int zzcun = 0;

    public zzks(String str) {
        this.zzctq = str;
    }

    public static boolean zzx(Context context) {
        int identifier = context.getResources().getIdentifier("Theme.Translucent", "style", AbstractSpiCall.ANDROID_CLIENT_TYPE);
        if (identifier == 0) {
            zzkx.zzdh("Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad.");
            return false;
        }
        try {
            if (identifier == context.getPackageManager().getActivityInfo(new ComponentName(context.getPackageName(), AdActivity.CLASS_NAME), 0).theme) {
                return true;
            }
            zzkx.zzdh("Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad.");
            return false;
        } catch (PackageManager.NameNotFoundException e) {
            zzkx.zzdi("Fail to fetch AdActivity theme");
            zzkx.zzdh("Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad.");
            return false;
        }
    }

    public void zzb(AdRequestParcel adRequestParcel, long j) {
        synchronized (this.zzako) {
            if (this.zzcuk == -1) {
                if (j - com.google.android.gms.ads.internal.zzu.zzgq().zzvc() > zzdr.zzbgb.get().longValue()) {
                    zzbg(-1);
                } else {
                    zzbg(com.google.android.gms.ads.internal.zzu.zzgq().zzvd());
                }
                this.zzcuk = j;
                this.zzcuj = this.zzcuk;
            } else {
                this.zzcuj = j;
            }
            if (adRequestParcel.extras == null || adRequestParcel.extras.getInt("gw", 2) != 1) {
                this.zzcul++;
                this.zzcui++;
            }
        }
    }

    public void zzbg(int i) {
        this.zzcui = i;
    }

    public Bundle zze(Context context, String str) {
        Bundle bundle;
        synchronized (this.zzako) {
            bundle = new Bundle();
            bundle.putString("session_id", this.zzctq);
            bundle.putLong("basets", this.zzcuk);
            bundle.putLong("currts", this.zzcuj);
            bundle.putString("seq_num", str);
            bundle.putInt("preqs", this.zzcul);
            bundle.putInt("preqs_in_session", this.zzcui);
            bundle.putInt("pclick", this.zzcum);
            bundle.putInt("pimp", this.zzcun);
            bundle.putBoolean("support_transparent_background", zzx(context));
        }
        return bundle;
    }

    public void zzug() {
        synchronized (this.zzako) {
            this.zzcun++;
        }
    }

    public void zzuh() {
        synchronized (this.zzako) {
            this.zzcum++;
        }
    }

    public int zzvd() {
        return this.zzcui;
    }

    public long zzvk() {
        return this.zzcuk;
    }
}
