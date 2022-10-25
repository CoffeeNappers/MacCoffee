package com.google.android.gms.internal;

import android.os.Looper;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
/* loaded from: classes.dex */
public class zzsc extends zzqq<Status> {
    @Deprecated
    public zzsc(Looper looper) {
        super(looper);
    }

    public zzsc(GoogleApiClient googleApiClient) {
        super(googleApiClient);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.zzqq
    /* renamed from: zzb */
    public Status zzc(Status status) {
        return status;
    }
}
