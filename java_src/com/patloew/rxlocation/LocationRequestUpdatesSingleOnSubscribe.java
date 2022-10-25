package com.patloew.rxlocation;

import android.app.PendingIntent;
import android.support.annotation.NonNull;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;
import io.reactivex.SingleEmitter;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
class LocationRequestUpdatesSingleOnSubscribe extends RxLocationSingleOnSubscribe<Status> {
    final LocationRequest locationRequest;
    final PendingIntent pendingIntent;

    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationRequestUpdatesSingleOnSubscribe(@NonNull RxLocation rxLocation, LocationRequest locationRequest, PendingIntent pendingIntent, Long timeout, TimeUnit timeUnit) {
        super(rxLocation, timeout, timeUnit);
        this.locationRequest = locationRequest;
        this.pendingIntent = pendingIntent;
    }

    @Override // com.patloew.rxlocation.RxLocationSingleOnSubscribe
    protected void onGoogleApiClientReady(GoogleApiClient apiClient, SingleEmitter<Status> emitter) {
        setupLocationPendingResult(LocationServices.FusedLocationApi.requestLocationUpdates(apiClient, this.locationRequest, this.pendingIntent), SingleResultCallBack.get(emitter));
    }
}
