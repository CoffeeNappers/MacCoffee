package com.google.android.gms.common.internal;

import android.support.annotation.NonNull;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.Status;
/* loaded from: classes2.dex */
public class zzb {
    @NonNull
    public static com.google.android.gms.common.api.zza zzaf(@NonNull Status status) {
        return status.hasResolution() ? new com.google.android.gms.common.api.zzd(status) : new com.google.android.gms.common.api.zza(status);
    }

    @NonNull
    public static com.google.android.gms.common.api.zza zzk(@NonNull ConnectionResult connectionResult) {
        return zzaf(new Status(connectionResult.getErrorCode(), connectionResult.getErrorMessage(), connectionResult.getResolution()));
    }
}
