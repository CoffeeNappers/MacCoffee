package com.google.firebase.appindexing.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class UpdateTagsRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<UpdateTagsRequest> CREATOR = new zzk();
    private final String[] aWS;
    private final String[] aWT;
    public final int mVersionCode;
    private final String zzae;

    /* JADX INFO: Access modifiers changed from: package-private */
    public UpdateTagsRequest(int i, String str, String[] strArr, String[] strArr2) {
        this.mVersionCode = i;
        this.zzae = str;
        this.aWS = strArr;
        this.aWT = strArr2;
    }

    public String getUrl() {
        return this.zzae;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzk.zza(this, parcel, i);
    }

    public String[] zzcor() {
        return this.aWS;
    }

    public String[] zzcos() {
        return this.aWT;
    }
}
