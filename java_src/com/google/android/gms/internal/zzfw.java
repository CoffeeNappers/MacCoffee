package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
@zzji
/* loaded from: classes.dex */
public class zzfw {
    private final Context mContext;
    private final com.google.android.gms.ads.internal.zzd zzamb;
    private final zzgz zzamf;
    private final VersionInfoParcel zzanu;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzfw(Context context, zzgz zzgzVar, VersionInfoParcel versionInfoParcel, com.google.android.gms.ads.internal.zzd zzdVar) {
        this.mContext = context;
        this.zzamf = zzgzVar;
        this.zzanu = versionInfoParcel;
        this.zzamb = zzdVar;
    }

    public Context getApplicationContext() {
        return this.mContext.getApplicationContext();
    }

    public com.google.android.gms.ads.internal.zzl zzbj(String str) {
        return new com.google.android.gms.ads.internal.zzl(this.mContext, new AdSizeParcel(), str, this.zzamf, this.zzanu, this.zzamb);
    }

    public com.google.android.gms.ads.internal.zzl zzbk(String str) {
        return new com.google.android.gms.ads.internal.zzl(this.mContext.getApplicationContext(), new AdSizeParcel(), str, this.zzamf, this.zzanu, this.zzamb);
    }

    public zzfw zznl() {
        return new zzfw(getApplicationContext(), this.zzamf, this.zzanu, this.zzamb);
    }
}
