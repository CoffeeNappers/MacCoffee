package com.google.android.gms.internal;

import android.app.Activity;
import android.support.v4.app.FragmentActivity;
/* loaded from: classes2.dex */
public class zzrn {
    private final Object Be;

    public zzrn(Activity activity) {
        com.google.android.gms.common.internal.zzaa.zzb(activity, "Activity must not be null");
        com.google.android.gms.common.internal.zzaa.zzb(com.google.android.gms.common.util.zzs.zzayn() || (activity instanceof FragmentActivity), "This Activity is not supported before platform version 11 (3.0 Honeycomb). Please use FragmentActivity instead.");
        this.Be = activity;
    }

    public boolean zzatv() {
        return this.Be instanceof FragmentActivity;
    }

    public Activity zzatw() {
        return (Activity) this.Be;
    }

    public FragmentActivity zzatx() {
        return (FragmentActivity) this.Be;
    }
}
