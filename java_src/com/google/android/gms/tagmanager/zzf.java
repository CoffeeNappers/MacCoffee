package com.google.android.gms.tagmanager;

import android.content.Context;
import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzf extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.APP_ID.toString();
    private final Context mContext;

    public zzf(Context context) {
        super(ID, new String[0]);
        this.mContext = context;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        return zzdm.zzat(this.mContext.getPackageName());
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }
}
