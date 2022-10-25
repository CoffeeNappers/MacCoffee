package com.google.android.gms.measurement.internal;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class AppMetadata extends AbstractSafeParcelable {
    public static final Parcelable.Creator<AppMetadata> CREATOR = new zzb();
    public final String aii;
    public final String aqZ;
    public final String ara;
    public final long arb;
    public final long arc;
    public final String ard;
    public final boolean are;
    public final boolean arf;
    public final long arg;
    public final String arh;
    public final String packageName;
    public final int versionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AppMetadata(int i, String str, String str2, String str3, String str4, long j, long j2, String str5, boolean z, boolean z2, long j3, String str6) {
        this.versionCode = i;
        this.packageName = str;
        this.aqZ = str2;
        this.aii = str3;
        this.arg = i < 5 ? -2147483648L : j3;
        this.ara = str4;
        this.arb = j;
        this.arc = j2;
        this.ard = str5;
        if (i >= 3) {
            this.are = z;
        } else {
            this.are = true;
        }
        this.arf = z2;
        this.arh = str6;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AppMetadata(String str, String str2, String str3, long j, String str4, long j2, long j3, String str5, boolean z, boolean z2, String str6) {
        com.google.android.gms.common.internal.zzaa.zzib(str);
        this.versionCode = 6;
        this.packageName = str;
        this.aqZ = TextUtils.isEmpty(str2) ? null : str2;
        this.aii = str3;
        this.arg = j;
        this.ara = str4;
        this.arb = j2;
        this.arc = j3;
        this.ard = str5;
        this.are = z;
        this.arf = z2;
        this.arh = str6;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }
}
