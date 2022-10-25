package com.google.android.gms.ads.internal.purchase;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.internal.zzif;
import com.google.android.gms.internal.zzji;
@zzji
/* loaded from: classes.dex */
public final class GInAppPurchaseManagerInfoParcel extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<GInAppPurchaseManagerInfoParcel> CREATOR = new zza();
    public final int versionCode;
    public final zzk zzasf;
    public final zzif zzcfa;
    public final Context zzcfb;
    public final zzj zzcfc;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GInAppPurchaseManagerInfoParcel(int i, IBinder iBinder, IBinder iBinder2, IBinder iBinder3, IBinder iBinder4) {
        this.versionCode = i;
        this.zzasf = (zzk) com.google.android.gms.dynamic.zze.zzae(zzd.zza.zzfd(iBinder));
        this.zzcfa = (zzif) com.google.android.gms.dynamic.zze.zzae(zzd.zza.zzfd(iBinder2));
        this.zzcfb = (Context) com.google.android.gms.dynamic.zze.zzae(zzd.zza.zzfd(iBinder3));
        this.zzcfc = (zzj) com.google.android.gms.dynamic.zze.zzae(zzd.zza.zzfd(iBinder4));
    }

    public GInAppPurchaseManagerInfoParcel(Context context, zzk zzkVar, zzif zzifVar, zzj zzjVar) {
        this.versionCode = 2;
        this.zzcfb = context;
        this.zzasf = zzkVar;
        this.zzcfa = zzifVar;
        this.zzcfc = zzjVar;
    }

    public static void zza(Intent intent, GInAppPurchaseManagerInfoParcel gInAppPurchaseManagerInfoParcel) {
        Bundle bundle = new Bundle(1);
        bundle.putParcelable("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo", gInAppPurchaseManagerInfoParcel);
        intent.putExtra("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo", bundle);
    }

    public static GInAppPurchaseManagerInfoParcel zzc(Intent intent) {
        try {
            Bundle bundleExtra = intent.getBundleExtra("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo");
            bundleExtra.setClassLoader(GInAppPurchaseManagerInfoParcel.class.getClassLoader());
            return (GInAppPurchaseManagerInfoParcel) bundleExtra.getParcelable("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo");
        } catch (Exception e) {
            return null;
        }
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zza.zza(this, parcel, i);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzrn() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzcfc).asBinder();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzro() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzasf).asBinder();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzrp() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzcfa).asBinder();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzrq() {
        return com.google.android.gms.dynamic.zze.zzac(this.zzcfb).asBinder();
    }
}
