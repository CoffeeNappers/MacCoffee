package com.google.android.gms.ads;

import android.content.Context;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.ads.internal.client.zzag;
import com.google.android.gms.ads.internal.client.zzah;
import com.google.android.gms.ads.reward.RewardedVideoAd;
/* loaded from: classes.dex */
public class MobileAds {

    /* loaded from: classes.dex */
    public static final class Settings {
        private final zzah zzakn = new zzah();

        @Deprecated
        public String getTrackingId() {
            zzah zzahVar = this.zzakn;
            return null;
        }

        @Deprecated
        public boolean isGoogleAnalyticsEnabled() {
            zzah zzahVar = this.zzakn;
            return false;
        }

        @Deprecated
        public Settings setGoogleAnalyticsEnabled(boolean z) {
            this.zzakn.zzq(z);
            return this;
        }

        @Deprecated
        public Settings setTrackingId(String str) {
            this.zzakn.zzav(str);
            return this;
        }

        zzah zzdv() {
            return this.zzakn;
        }
    }

    private MobileAds() {
    }

    public static RewardedVideoAd getRewardedVideoAdInstance(Context context) {
        return zzag.zzli().getRewardedVideoAdInstance(context);
    }

    public static void initialize(Context context) {
        initialize(context, null, null);
    }

    @RequiresPermission("android.permission.INTERNET")
    public static void initialize(Context context, String str) {
        initialize(context, str, null);
    }

    @RequiresPermission("android.permission.INTERNET")
    @Deprecated
    public static void initialize(Context context, String str, Settings settings) {
        zzag.zzli().zza(context, str, settings == null ? null : settings.zzdv());
    }

    public static void openDebugMenu(Context context, String str) {
        zzag.zzli().openDebugMenu(context, str);
    }

    public static void setAppMuted(boolean z) {
        zzag.zzli().setAppMuted(z);
    }

    public static void setAppVolume(float f) {
        zzag.zzli().setAppVolume(f);
    }
}
