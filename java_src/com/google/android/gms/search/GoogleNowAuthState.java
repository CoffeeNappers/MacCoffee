package com.google.android.gms.search;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class GoogleNowAuthState extends AbstractSafeParcelable {
    public static final Parcelable.Creator<GoogleNowAuthState> CREATOR = new zza();
    String aCV;
    String aCW;
    long aCX;
    final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GoogleNowAuthState(int i, String str, String str2, long j) {
        this.mVersionCode = i;
        this.aCV = str;
        this.aCW = str2;
        this.aCX = j;
    }

    public String getAccessToken() {
        return this.aCW;
    }

    public String getAuthCode() {
        return this.aCV;
    }

    public long getNextAllowedTimeMillis() {
        return this.aCX;
    }

    public String toString() {
        String str = this.aCV;
        String str2 = this.aCW;
        return new StringBuilder(String.valueOf(str).length() + 74 + String.valueOf(str2).length()).append("mAuthCode = ").append(str).append("\nmAccessToken = ").append(str2).append("\nmNextAllowedTimeMillis = ").append(this.aCX).toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zza.zza(this, parcel, i);
    }
}
