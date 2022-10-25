package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import com.google.android.gms.R;
import com.google.android.gms.common.api.Status;
@Deprecated
/* loaded from: classes.dex */
public final class zzrk {
    private static zzrk Ba;
    private static final Object zzaox = new Object();
    private final Status Bb;
    private final boolean Bc;
    private final boolean Bd;
    private final String zzctj;

    zzrk(Context context) {
        boolean z = true;
        Resources resources = context.getResources();
        int identifier = resources.getIdentifier("google_app_measurement_enable", "integer", resources.getResourcePackageName(R.string.common_google_play_services_unknown_issue));
        if (identifier != 0) {
            boolean z2 = resources.getInteger(identifier) != 0;
            this.Bd = z2 ? false : z;
            z = z2;
        } else {
            this.Bd = false;
        }
        this.Bc = z;
        String zzcd = com.google.android.gms.common.internal.zzy.zzcd(context);
        zzcd = zzcd == null ? new com.google.android.gms.common.internal.zzah(context).getString("google_app_id") : zzcd;
        if (TextUtils.isEmpty(zzcd)) {
            this.Bb = new Status(10, "Missing google app id value from from string resources with name google_app_id.");
            this.zzctj = null;
            return;
        }
        this.zzctj = zzcd;
        this.Bb = Status.xZ;
    }

    public static String zzatt() {
        return zzhh("getGoogleAppId").zzctj;
    }

    public static boolean zzatu() {
        return zzhh("isMeasurementExplicitlyDisabled").Bd;
    }

    public static Status zzby(Context context) {
        Status status;
        com.google.android.gms.common.internal.zzaa.zzb(context, "Context must not be null.");
        synchronized (zzaox) {
            if (Ba == null) {
                Ba = new zzrk(context);
            }
            status = Ba.Bb;
        }
        return status;
    }

    private static zzrk zzhh(String str) {
        zzrk zzrkVar;
        synchronized (zzaox) {
            if (Ba == null) {
                throw new IllegalStateException(new StringBuilder(String.valueOf(str).length() + 34).append("Initialize must be called before ").append(str).append(".").toString());
            }
            zzrkVar = Ba;
        }
        return zzrkVar;
    }
}
