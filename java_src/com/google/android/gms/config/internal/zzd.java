package com.google.android.gms.config.internal;

import android.content.Context;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.internal.zzqk;
import com.google.android.gms.internal.zzta;
import com.google.android.gms.internal.zztb;
/* loaded from: classes2.dex */
public class zzd extends com.google.android.gms.common.api.zzc<Api.ApiOptions.NoOptions> {
    public zzd(Context context) {
        super(context, zzta.API, (Api.ApiOptions) null, new zzqk());
    }

    public PendingResult<zztb.zzb> zza(zztb.zza zzaVar) {
        return zzta.GR.zza(asGoogleApiClient(), zzaVar);
    }
}
