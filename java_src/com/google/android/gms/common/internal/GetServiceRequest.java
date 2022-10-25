package com.google.android.gms.common.internal;

import android.accounts.Account;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzp;
import java.util.Collection;
/* loaded from: classes2.dex */
public class GetServiceRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<GetServiceRequest> CREATOR = new zzi();
    final int DU;
    int DV;
    String DW;
    IBinder DX;
    Scope[] DY;
    Bundle DZ;
    Account Ea;
    long Eb;
    final int version;

    public GetServiceRequest(int i) {
        this.version = 3;
        this.DV = com.google.android.gms.common.zzc.GOOGLE_PLAY_SERVICES_VERSION_CODE;
        this.DU = i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GetServiceRequest(int i, int i2, int i3, String str, IBinder iBinder, Scope[] scopeArr, Bundle bundle, Account account, long j) {
        this.version = i;
        this.DU = i2;
        this.DV = i3;
        if ("com.google.android.gms".equals(str)) {
            this.DW = "com.google.android.gms";
        } else {
            this.DW = str;
        }
        if (i < 2) {
            this.Ea = zzdq(iBinder);
        } else {
            this.DX = iBinder;
            this.Ea = account;
        }
        this.DY = scopeArr;
        this.DZ = bundle;
        this.Eb = j;
    }

    private Account zzdq(IBinder iBinder) {
        if (iBinder != null) {
            return zza.zza(zzp.zza.zzdr(iBinder));
        }
        return null;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzi.zza(this, parcel, i);
    }

    public GetServiceRequest zzb(zzp zzpVar) {
        if (zzpVar != null) {
            this.DX = zzpVar.asBinder();
        }
        return this;
    }

    public GetServiceRequest zze(Account account) {
        this.Ea = account;
        return this;
    }

    public GetServiceRequest zzf(Collection<Scope> collection) {
        this.DY = (Scope[]) collection.toArray(new Scope[collection.size()]);
        return this;
    }

    public GetServiceRequest zzhv(String str) {
        this.DW = str;
        return this;
    }

    public GetServiceRequest zzo(Bundle bundle) {
        this.DZ = bundle;
        return this;
    }
}
