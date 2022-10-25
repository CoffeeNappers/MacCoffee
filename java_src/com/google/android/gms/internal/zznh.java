package com.google.android.gms.internal;

import android.os.ParcelFileDescriptor;
import com.google.android.gms.appdatasearch.GetRecentContextCall;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzng;
import com.google.android.gms.internal.zzqo;
/* loaded from: classes2.dex */
public abstract class zznh<T> extends zzng.zza {
    protected zzqo.zzb<T> gY;

    public zznh(zzqo.zzb<T> zzbVar) {
        this.gY = zzbVar;
    }

    @Override // com.google.android.gms.internal.zzng
    public void zza(GetRecentContextCall.Response response) {
    }

    @Override // com.google.android.gms.internal.zzng
    public void zza(Status status) {
    }

    @Override // com.google.android.gms.internal.zzng
    public void zza(Status status, ParcelFileDescriptor parcelFileDescriptor) {
    }

    @Override // com.google.android.gms.internal.zzng
    public void zza(Status status, boolean z) {
    }
}
