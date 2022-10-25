package com.google.android.gms.auth;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import java.util.List;
/* loaded from: classes2.dex */
public class AccountChangeEventsResponse extends AbstractSafeParcelable {
    public static final Parcelable.Creator<AccountChangeEventsResponse> CREATOR = new zzc();
    final int mVersion;
    final List<AccountChangeEvent> zzani;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AccountChangeEventsResponse(int i, List<AccountChangeEvent> list) {
        this.mVersion = i;
        this.zzani = (List) zzaa.zzy(list);
    }

    public AccountChangeEventsResponse(List<AccountChangeEvent> list) {
        this.mVersion = 1;
        this.zzani = (List) zzaa.zzy(list);
    }

    public List<AccountChangeEvent> getEvents() {
        return this.zzani;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzc.zza(this, parcel, i);
    }
}
