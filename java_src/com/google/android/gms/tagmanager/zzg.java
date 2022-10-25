package com.google.android.gms.tagmanager;

import android.content.Context;
import android.content.pm.PackageManager;
import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class zzg extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.APP_NAME.toString();
    private final Context mContext;

    public zzg(Context context) {
        super(ID, new String[0]);
        this.mContext = context;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        try {
            PackageManager packageManager = this.mContext.getPackageManager();
            return zzdm.zzat(packageManager.getApplicationLabel(packageManager.getApplicationInfo(this.mContext.getPackageName(), 0)).toString());
        } catch (PackageManager.NameNotFoundException e) {
            zzbo.zzb("App name is not found.", e);
            return zzdm.zzchm();
        }
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
