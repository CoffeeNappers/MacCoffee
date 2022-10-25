package com.patloew.rxlocation;

import android.app.PendingIntent;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.GeofencingRequest;
import com.google.android.gms.location.LocationServices;
import io.reactivex.SingleEmitter;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
class GeofencingAddSingleOnSubscribe extends RxLocationSingleOnSubscribe<Status> {
    final GeofencingRequest geofencingRequest;
    final PendingIntent pendingIntent;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GeofencingAddSingleOnSubscribe(RxLocation rxLocation, GeofencingRequest geofencingRequest, PendingIntent pendingIntent, Long timeoutTime, TimeUnit timeoutUnit) {
        super(rxLocation, timeoutTime, timeoutUnit);
        this.geofencingRequest = geofencingRequest;
        this.pendingIntent = pendingIntent;
    }

    @Override // com.patloew.rxlocation.RxLocationSingleOnSubscribe
    protected void onGoogleApiClientReady(GoogleApiClient apiClient, SingleEmitter<Status> emitter) {
        setupLocationPendingResult(LocationServices.GeofencingApi.addGeofences(apiClient, this.geofencingRequest, this.pendingIntent), SingleResultCallBack.get(emitter));
    }
}
