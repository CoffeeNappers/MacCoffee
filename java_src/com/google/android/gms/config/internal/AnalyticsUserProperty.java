package com.google.android.gms.config.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class AnalyticsUserProperty extends AbstractSafeParcelable {
    public static final Parcelable.Creator<AnalyticsUserProperty> CREATOR = new zza();
    private final String mName;
    private final String mValue;
    private final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AnalyticsUserProperty(int i, String str, String str2) {
        this.mVersionCode = i;
        this.mName = str;
        this.mValue = str2;
    }

    public AnalyticsUserProperty(String str, String str2) {
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
        zza.zza(this, parcel, i);
    }
}
