package com.google.android.gms.ads.internal.request;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public class CapabilityParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<CapabilityParcel> CREATOR = new zzj();
    public final int versionCode;
    public final boolean zzcmb;
    public final boolean zzcmc;
    public final boolean zzcmd;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CapabilityParcel(int i, boolean z, boolean z2, boolean z3) {
        this.versionCode = i;
        this.zzcmb = z;
        this.zzcmc = z2;
        this.zzcmd = z3;
    }

    public CapabilityParcel(boolean z, boolean z2, boolean z3) {
        this(2, z, z2, z3);
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putBoolean("iap_supported", this.zzcmb);
        bundle.putBoolean("default_iap_supported", this.zzcmc);
        bundle.putBoolean("app_streaming_supported", this.zzcmd);
        return bundle;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzj.zza(this, parcel, i);
    }
}
