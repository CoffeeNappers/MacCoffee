package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.customtabs.CustomTabsCallback;
import android.support.customtabs.CustomTabsClient;
import android.support.customtabs.CustomTabsServiceConnection;
import android.support.customtabs.CustomTabsSession;
import java.util.List;
@zzji
/* loaded from: classes.dex */
public class zzef implements zzasi {
    @Nullable
    private CustomTabsSession zzbmg;
    @Nullable
    private CustomTabsClient zzbmh;
    @Nullable
    private CustomTabsServiceConnection zzbmi;
    @Nullable
    private zza zzbmj;

    /* loaded from: classes2.dex */
    public interface zza {
        void zzmh();

        void zzmi();
    }

    public static boolean zzn(Context context) {
        PackageManager packageManager = context.getPackageManager();
        if (packageManager == null) {
            return false;
        }
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("http://www.example.com"));
        ResolveInfo resolveActivity = packageManager.resolveActivity(intent, 0);
        List<ResolveInfo> queryIntentActivities = packageManager.queryIntentActivities(intent, 65536);
        if (queryIntentActivities == null || resolveActivity == null) {
            return false;
        }
        for (int i = 0; i < queryIntentActivities.size(); i++) {
            if (resolveActivity.activityInfo.name.equals(queryIntentActivities.get(i).activityInfo.name)) {
                return resolveActivity.activityInfo.packageName.equals(zzasg.zzfa(context));
            }
        }
        return false;
    }

    public boolean mayLaunchUrl(Uri uri, Bundle bundle, List<Bundle> list) {
        CustomTabsSession zzmf;
        if (this.zzbmh == null || (zzmf = zzmf()) == null) {
            return false;
        }
        return zzmf.mayLaunchUrl(uri, bundle, list);
    }

    @Override // com.google.android.gms.internal.zzasi
    public void zza(CustomTabsClient customTabsClient) {
        this.zzbmh = customTabsClient;
        this.zzbmh.warmup(0L);
        if (this.zzbmj != null) {
            this.zzbmj.zzmh();
        }
    }

    public void zza(zza zzaVar) {
        this.zzbmj = zzaVar;
    }

    public void zzd(Activity activity) {
        if (this.zzbmi == null) {
            return;
        }
        activity.unbindService(this.zzbmi);
        this.zzbmh = null;
        this.zzbmg = null;
        this.zzbmi = null;
    }

    public void zze(Activity activity) {
        String zzfa;
        if (this.zzbmh == null && (zzfa = zzasg.zzfa(activity)) != null) {
            this.zzbmi = new zzash(this);
            CustomTabsClient.bindCustomTabsService(activity, zzfa, this.zzbmi);
        }
    }

    @Nullable
    public CustomTabsSession zzmf() {
        if (this.zzbmh == null) {
            this.zzbmg = null;
        } else if (this.zzbmg == null) {
            this.zzbmg = this.zzbmh.newSession((CustomTabsCallback) null);
        }
        return this.zzbmg;
    }

    @Override // com.google.android.gms.internal.zzasi
    public void zzmg() {
        this.zzbmh = null;
        this.zzbmg = null;
        if (this.zzbmj != null) {
            this.zzbmj.zzmi();
        }
    }
}
