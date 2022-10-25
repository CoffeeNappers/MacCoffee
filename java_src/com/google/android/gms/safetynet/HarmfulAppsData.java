package com.google.android.gms.safetynet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class HarmfulAppsData extends AbstractSafeParcelable {
    public static final Parcelable.Creator<HarmfulAppsData> CREATOR = new zzb();
    public final byte[] aCe;
    public final int aCf;
    public final String apkPackageName;
    public final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public HarmfulAppsData(int i, String str, byte[] bArr, int i2) {
        this.mVersionCode = i;
        this.apkPackageName = str;
        this.aCe = bArr;
        this.aCf = i2;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }
}
