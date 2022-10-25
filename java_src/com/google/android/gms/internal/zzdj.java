package com.google.android.gms.internal;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
@zzji
/* loaded from: classes.dex */
public class zzdj {
    private final Context mContext;

    public zzdj(Context context) {
        com.google.android.gms.common.internal.zzaa.zzb(context, "Context can not be null");
        this.mContext = context;
    }

    public static boolean zzlm() {
        return "mounted".equals(Environment.getExternalStorageState());
    }

    public boolean zza(Intent intent) {
        com.google.android.gms.common.internal.zzaa.zzb(intent, "Intent can not be null");
        return !this.mContext.getPackageManager().queryIntentActivities(intent, 0).isEmpty();
    }

    public boolean zzlj() {
        Intent intent = new Intent("android.intent.action.DIAL");
        intent.setData(Uri.parse("tel:"));
        return zza(intent);
    }

    public boolean zzlk() {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse("sms:"));
        return zza(intent);
    }

    public boolean zzll() {
        return zzlm() && this.mContext.checkCallingOrSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") == 0;
    }

    @TargetApi(14)
    public boolean zzln() {
        return Build.VERSION.SDK_INT >= 14 && zza(new Intent("android.intent.action.INSERT").setType("vnd.android.cursor.dir/event"));
    }
}
