package com.google.android.gms.tagmanager;

import android.content.Context;
import android.provider.Settings;
import com.google.android.gms.internal.zzaj;
import java.util.Map;
/* loaded from: classes2.dex */
class zzbs extends zzam {
    private static final String ID = com.google.android.gms.internal.zzag.MOBILE_ADWORDS_UNIQUE_ID.toString();
    private final Context mContext;

    public zzbs(Context context) {
        super(ID, new String[0]);
        this.mContext = context;
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public zzaj.zza zzay(Map<String, zzaj.zza> map) {
        String zzdy = zzdy(this.mContext);
        return zzdy == null ? zzdm.zzchm() : zzdm.zzat(zzdy);
    }

    @Override // com.google.android.gms.tagmanager.zzam
    public boolean zzcdu() {
        return true;
    }

    protected String zzdy(Context context) {
        return Settings.Secure.getString(context.getContentResolver(), "android_id");
    }
}
