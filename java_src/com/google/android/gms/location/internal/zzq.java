package com.google.android.gms.location.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.LocationSettingsResult;
import com.google.android.gms.location.SettingsApi;
/* loaded from: classes2.dex */
public class zzq implements SettingsApi {
    @Override // com.google.android.gms.location.SettingsApi
    public PendingResult<LocationSettingsResult> checkLocationSettings(GoogleApiClient googleApiClient, LocationSettingsRequest locationSettingsRequest) {
        return zza(googleApiClient, locationSettingsRequest, null);
    }

    public PendingResult<LocationSettingsResult> zza(GoogleApiClient googleApiClient, final LocationSettingsRequest locationSettingsRequest, final String str) {
        return googleApiClient.zza((GoogleApiClient) new LocationServices.zza<LocationSettingsResult>(googleApiClient) { // from class: com.google.android.gms.location.internal.zzq.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.internal.zzqo.zza
            public void zza(zzl zzlVar) throws RemoteException {
                zzlVar.zza(locationSettingsRequest, this, str);
            }

            @Override // com.google.android.gms.internal.zzqq
            /* renamed from: zzdp */
            public LocationSettingsResult zzc(Status status) {
                return new LocationSettingsResult(status);
            }
        });
    }
}
