package com.patloew.rxlocation;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.LocationSettingsResult;
import io.reactivex.SingleEmitter;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
class SettingsCheckSingleOnSubscribe extends RxLocationSingleOnSubscribe<LocationSettingsResult> {
    final LocationSettingsRequest locationSettingsRequest;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SettingsCheckSingleOnSubscribe(RxLocation rxLocation, LocationSettingsRequest locationSettingsRequest, Long timeoutTime, TimeUnit timeoutUnit) {
        super(rxLocation, timeoutTime, timeoutUnit);
        this.locationSettingsRequest = locationSettingsRequest;
    }

    @Override // com.patloew.rxlocation.RxLocationSingleOnSubscribe
    protected void onGoogleApiClientReady(GoogleApiClient apiClient, SingleEmitter<LocationSettingsResult> emitter) {
        setupLocationPendingResult(LocationServices.SettingsApi.checkLocationSettings(apiClient, this.locationSettingsRequest), SingleResultCallBack.get(emitter));
    }
}
