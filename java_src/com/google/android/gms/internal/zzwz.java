package com.google.android.gms.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.internal.zzqo;
import com.google.android.gms.safetynet.SafetyNet;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public abstract class zzwz<R extends Result> extends zzqo.zza<R, zzxd> {
    public zzwz(GoogleApiClient googleApiClient) {
        super(SafetyNet.API, googleApiClient);
    }
}
