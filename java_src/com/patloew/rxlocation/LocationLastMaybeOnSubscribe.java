package com.patloew.rxlocation;

import android.location.Location;
import android.support.annotation.NonNull;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.LocationServices;
import io.reactivex.MaybeEmitter;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
class LocationLastMaybeOnSubscribe extends RxLocationMaybeOnSubscribe<Location> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationLastMaybeOnSubscribe(@NonNull RxLocation rxLocation) {
        super(rxLocation, (Long) null, (TimeUnit) null);
    }

    @Override // com.patloew.rxlocation.RxLocationMaybeOnSubscribe
    protected void onGoogleApiClientReady(GoogleApiClient apiClient, MaybeEmitter<Location> emitter) {
        Location location = LocationServices.FusedLocationApi.getLastLocation(apiClient);
        if (location != null) {
            emitter.onSuccess(location);
        } else {
            emitter.onComplete();
        }
    }
}
