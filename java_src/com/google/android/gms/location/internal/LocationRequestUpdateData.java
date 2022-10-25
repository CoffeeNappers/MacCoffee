package com.google.android.gms.location.internal;

import android.app.PendingIntent;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.location.internal.zzg;
import com.google.android.gms.location.zzh;
import com.google.android.gms.location.zzi;
/* loaded from: classes2.dex */
public class LocationRequestUpdateData extends AbstractSafeParcelable {
    public static final Parcelable.Creator<LocationRequestUpdateData> CREATOR = new zzn();
    int alf;
    LocationRequestInternal alg;
    com.google.android.gms.location.zzi alh;
    com.google.android.gms.location.zzh ali;
    zzg alj;
    PendingIntent mPendingIntent;
    private final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationRequestUpdateData(int i, int i2, LocationRequestInternal locationRequestInternal, IBinder iBinder, PendingIntent pendingIntent, IBinder iBinder2, IBinder iBinder3) {
        zzg zzgVar = null;
        this.mVersionCode = i;
        this.alf = i2;
        this.alg = locationRequestInternal;
        this.alh = iBinder == null ? null : zzi.zza.zzhc(iBinder);
        this.mPendingIntent = pendingIntent;
        this.ali = iBinder2 == null ? null : zzh.zza.zzhb(iBinder2);
        this.alj = iBinder3 != null ? zzg.zza.zzhe(iBinder3) : zzgVar;
    }

    public static LocationRequestUpdateData zza(LocationRequestInternal locationRequestInternal, PendingIntent pendingIntent, @Nullable zzg zzgVar) {
        return new LocationRequestUpdateData(1, 1, locationRequestInternal, null, pendingIntent, null, zzgVar != null ? zzgVar.asBinder() : null);
    }

    public static LocationRequestUpdateData zza(LocationRequestInternal locationRequestInternal, com.google.android.gms.location.zzh zzhVar, @Nullable zzg zzgVar) {
        return new LocationRequestUpdateData(1, 1, locationRequestInternal, null, null, zzhVar.asBinder(), zzgVar != null ? zzgVar.asBinder() : null);
    }

    public static LocationRequestUpdateData zza(LocationRequestInternal locationRequestInternal, com.google.android.gms.location.zzi zziVar, @Nullable zzg zzgVar) {
        return new LocationRequestUpdateData(1, 1, locationRequestInternal, zziVar.asBinder(), null, null, zzgVar != null ? zzgVar.asBinder() : null);
    }

    public static LocationRequestUpdateData zza(com.google.android.gms.location.zzh zzhVar, @Nullable zzg zzgVar) {
        return new LocationRequestUpdateData(1, 2, null, null, null, zzhVar.asBinder(), zzgVar != null ? zzgVar.asBinder() : null);
    }

    public static LocationRequestUpdateData zza(com.google.android.gms.location.zzi zziVar, @Nullable zzg zzgVar) {
        return new LocationRequestUpdateData(1, 2, null, zziVar.asBinder(), null, null, zzgVar != null ? zzgVar.asBinder() : null);
    }

    public static LocationRequestUpdateData zzb(PendingIntent pendingIntent, @Nullable zzg zzgVar) {
        return new LocationRequestUpdateData(1, 2, null, null, pendingIntent, null, zzgVar != null ? zzgVar.asBinder() : null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzn.zza(this, parcel, i);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzbqi() {
        if (this.alh == null) {
            return null;
        }
        return this.alh.asBinder();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzbqj() {
        if (this.ali == null) {
            return null;
        }
        return this.ali.asBinder();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder zzbqk() {
        if (this.alj == null) {
            return null;
        }
        return this.alj.asBinder();
    }
}
