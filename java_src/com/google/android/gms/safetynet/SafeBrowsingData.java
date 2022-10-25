package com.google.android.gms.safetynet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class SafeBrowsingData extends AbstractSafeParcelable {
    public static final Parcelable.Creator<SafeBrowsingData> CREATOR = new zzd();
    private String aCg;
    private DataHolder aCh;
    public final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SafeBrowsingData(int i, String str, DataHolder dataHolder) {
        this.mVersionCode = i;
        this.aCg = str;
        this.aCh = dataHolder;
    }

    public SafeBrowsingData(String str) {
        this(1, str, null);
    }

    public SafeBrowsingData(String str, DataHolder dataHolder) {
        this(1, str, dataHolder);
    }

    public DataHolder getBlacklistsDataHolder() {
        return this.aCh;
    }

    public String getMetadata() {
        return this.aCg;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzd.zza(this, parcel, i);
    }
}
