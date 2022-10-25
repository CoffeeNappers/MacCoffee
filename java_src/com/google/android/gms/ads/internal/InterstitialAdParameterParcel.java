package com.google.android.gms.ads.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public final class InterstitialAdParameterParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<InterstitialAdParameterParcel> CREATOR = new zzm();
    public final int versionCode;
    public final boolean zzaok;
    public final boolean zzaol;
    public final String zzaom;
    public final boolean zzaon;
    public final float zzaoo;
    public final int zzaop;

    /* JADX INFO: Access modifiers changed from: package-private */
    public InterstitialAdParameterParcel(int i, boolean z, boolean z2, String str, boolean z3, float f, int i2) {
        this.versionCode = i;
        this.zzaok = z;
        this.zzaol = z2;
        this.zzaom = str;
        this.zzaon = z3;
        this.zzaoo = f;
        this.zzaop = i2;
    }

    public InterstitialAdParameterParcel(boolean z, boolean z2, boolean z3, float f, int i) {
        this(3, z, z2, null, z3, f, i);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzm.zza(this, parcel, i);
    }
}
