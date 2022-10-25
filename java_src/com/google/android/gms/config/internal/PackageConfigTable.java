package com.google.android.gms.config.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class PackageConfigTable extends AbstractSafeParcelable {
    public static final Parcelable.Creator<PackageConfigTable> CREATOR = new zzk();
    private final Bundle Hl;
    private final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public PackageConfigTable(int i, Bundle bundle) {
        this.mVersionCode = i;
        this.Hl = bundle;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzk.zza(this, parcel, i);
    }

    public Bundle zzazt() {
        return this.Hl;
    }
}
