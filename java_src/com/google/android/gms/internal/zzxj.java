package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.UserManager;
import android.provider.Settings;
import com.vkontakte.android.fragments.gifts.ProfileGiftsFragment;
/* loaded from: classes2.dex */
public class zzxj {
    private volatile Boolean aCU = null;
    private final Context mContext;

    public zzxj(Context context) {
        this.mContext = context;
    }

    public static boolean zzds(Context context) {
        if (com.google.android.gms.common.util.zzs.zzayx()) {
            return zzdt(context);
        }
        return false;
    }

    @TargetApi(21)
    private static boolean zzdt(Context context) {
        UserManager userManager = (UserManager) context.getSystemService(ProfileGiftsFragment.Extra.User);
        return userManager != null && userManager.hasUserRestriction("ensure_verify_apps");
    }

    public static boolean zzdu(Context context) {
        return zze(context, "package_verifier_enable", 1) == 1;
    }

    @TargetApi(17)
    private static int zze(Context context, String str, int i) {
        return com.google.android.gms.common.util.zzs.zzays() ? Settings.Global.getInt(context.getContentResolver(), str, i) : Settings.Secure.getInt(context.getContentResolver(), str, i);
    }

    public boolean zzccx() {
        return zzccz() ? zzccy() : zzccy() && zzdu(this.mContext);
    }

    public boolean zzccy() {
        if (zzccz()) {
            return (com.google.android.gms.common.util.zzs.zzayx() && zzds(this.mContext)) || Settings.Secure.getInt(this.mContext.getContentResolver(), "package_verifier_user_consent", 0) == 1;
        } else if (com.google.android.gms.common.util.zzs.zzayu()) {
            return Settings.Secure.getInt(this.mContext.getContentResolver(), "package_verifier_user_consent", 0) == 1;
        } else {
            try {
                return this.mContext.createPackageContext("com.android.vending", 2).getSharedPreferences("package_verifer_public_preferences", 1).getBoolean("accepted-anti-malware-consent", false);
            } catch (PackageManager.NameNotFoundException e) {
                return false;
            }
        }
    }

    public synchronized boolean zzccz() {
        boolean booleanValue;
        boolean z = false;
        synchronized (this) {
            if (this.aCU == null) {
                PackageInfo packageInfo = null;
                try {
                    packageInfo = this.mContext.getPackageManager().getPackageInfo("com.android.vending", 0);
                } catch (PackageManager.NameNotFoundException e) {
                }
                if (packageInfo == null || packageInfo.versionCode >= 80440000) {
                    z = true;
                }
                this.aCU = Boolean.valueOf(z);
            }
            booleanValue = this.aCU.booleanValue();
        }
        return booleanValue;
    }
}
