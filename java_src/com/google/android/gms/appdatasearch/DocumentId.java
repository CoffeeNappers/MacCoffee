package com.google.android.gms.appdatasearch;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class DocumentId extends AbstractSafeParcelable {
    public static final Parcelable.Creator<DocumentId> CREATOR = new zzc();
    final String gk;
    final String gl;
    final int mVersionCode;
    final String zzcjc;

    /* JADX INFO: Access modifiers changed from: package-private */
    public DocumentId(int i, String str, String str2, String str3) {
        this.mVersionCode = i;
        this.zzcjc = str;
        this.gk = str2;
        this.gl = str3;
    }

    public DocumentId(String str, String str2, String str3) {
        this(1, str, str2, str3);
    }

    public String toString() {
        return String.format("DocumentId[packageName=%s, corpusName=%s, uri=%s]", this.zzcjc, this.gk, this.gl);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzc.zza(this, parcel, i);
    }
}
