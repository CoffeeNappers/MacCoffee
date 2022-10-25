package com.patloew.rxlocation;

import android.support.annotation.NonNull;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.LocationAvailability;
import com.google.android.gms.location.LocationServices;
import io.reactivex.SingleEmitter;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
class LocationAvailabilitySingleOnSubscribe extends RxLocationSingleOnSubscribe<Boolean> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationAvailabilitySingleOnSubscribe(@NonNull RxLocation rxLocation) {
        super(rxLocation, (Long) null, (TimeUnit) null);
    }

    @Override // com.patloew.rxlocation.RxLocationSingleOnSubscribe
    protected void onGoogleApiClientReady(GoogleApiClient apiClient, SingleEmitter<Boolean> emitter) {
        LocationAvailability locationAvailability = LocationServices.FusedLocationApi.getLocationAvailability(apiClient);
        if (locationAvailability != null) {
            emitter.onSuccess(Boolean.valueOf(locationAvailability.isLocationAvailable()));
        } else {
            emitter.onSuccess(false);
        }
    }
}
