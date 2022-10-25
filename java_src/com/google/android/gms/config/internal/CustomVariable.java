package com.google.android.gms.config.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class CustomVariable extends AbstractSafeParcelable {
    public static final Parcelable.Creator<CustomVariable> CREATOR = new zzf();
    private final String mName;
    private final String mValue;
    private final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CustomVariable(int i, String str, String str2) {
        this.mVersionCode = i;
        this.mName = str;
        this.mValue = str2;
    }

    public CustomVariable(String str, String str2) {
        this(1, str, str2);
    }

    public String getName() {
        return this.mName;
    }

    public String getValue() {
        return this.mValue;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzf.zza(this, parcel, i);
    }
}
