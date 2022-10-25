package com.google.android.gms.config.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
/* loaded from: classes2.dex */
public class FetchConfigIpcResponse extends AbstractSafeParcelable {
    public static final Parcelable.Creator<FetchConfigIpcResponse> CREATOR = new zzh();
    private final long Hd;
    private final DataHolder Hk;
    private final int mVersionCode;
    private final int uo;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FetchConfigIpcResponse(int i, int i2, DataHolder dataHolder, long j) {
        this.mVersionCode = i;
        this.uo = i2;
        this.Hk = dataHolder;
        this.Hd = j;
    }

    public int getStatusCode() {
        return this.uo;
    }

    public long getThrottleEndTimeMillis() {
        return this.Hd;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzh.zza(this, parcel, i);
    }

    public DataHolder zzazr() {
        return this.Hk;
    }

    public void zzazs() {
        if (this.Hk == null || this.Hk.isClosed()) {
            return;
        }
        this.Hk.close();
    }
}
