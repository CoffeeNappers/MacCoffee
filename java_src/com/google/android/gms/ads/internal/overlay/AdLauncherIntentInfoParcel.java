package com.google.android.gms.ads.internal.overlay;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public final class AdLauncherIntentInfoParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<AdLauncherIntentInfoParcel> CREATOR = new zzb();
    public final Intent intent;
    public final String mimeType;
    public final String packageName;
    public final String url;
    public final int versionCode;
    public final String zzbzl;
    public final String zzbzm;
    public final String zzbzn;
    public final String zzbzo;

    public AdLauncherIntentInfoParcel(int i, String str, String str2, String str3, String str4, String str5, String str6, String str7, Intent intent) {
        this.versionCode = i;
        this.zzbzl = str;
        this.url = str2;
        this.mimeType = str3;
        this.packageName = str4;
        this.zzbzm = str5;
        this.zzbzn = str6;
        this.zzbzo = str7;
        this.intent = intent;
    }

    public AdLauncherIntentInfoParcel(Intent intent) {
        this(2, null, null, null, null, null, null, null, intent);
    }

    public AdLauncherIntentInfoParcel(String str, String str2, String str3, String str4, String str5, String str6, String str7) {
        this(2, str, str2, str3, str4, str5, str6, str7, null);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }
}
