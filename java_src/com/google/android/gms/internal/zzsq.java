package com.google.android.gms.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.zzqo;
/* loaded from: classes2.dex */
abstract class zzsq<R extends Result> extends zzqo.zza<R, zzsr> {

    /* loaded from: classes2.dex */
    static abstract class zza extends zzsq<Status> {
        public zza(GoogleApiClient googleApiClient) {
            super(googleApiClient);
        }

        @Override // com.google.android.gms.internal.zzqq
        /* renamed from: zzb */
        public Status zzc(Status status) {
            return status;
        }
    }

    public zzsq(GoogleApiClient googleApiClient) {
        super(zzsn.API, googleApiClient);
    }
}
