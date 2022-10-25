package com.patloew.rxlocation;

import android.app.PendingIntent;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.LocationServices;
import io.reactivex.SingleEmitter;
import java.util.List;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
class GeofencingRemoveSingleOnSubscribe extends RxLocationSingleOnSubscribe<Status> {
    final List<String> geofenceRequestIds;
    final PendingIntent pendingIntent;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GeofencingRemoveSingleOnSubscribe(RxLocation rxLocation, List<String> geofenceRequestIds, PendingIntent pendingIntent, Long timeoutTime, TimeUnit timeoutUnit) {
        super(rxLocation, timeoutTime, timeoutUnit);
        this.geofenceRequestIds = geofenceRequestIds;
        this.pendingIntent = pendingIntent;
    }

    @Override // com.patloew.rxlocation.RxLocationSingleOnSubscribe
    protected void onGoogleApiClientReady(GoogleApiClient apiClient, SingleEmitter<Status> emitter) {
        ResultCallback<Status> resultCallback = SingleResultCallBack.get(emitter);
        if (this.geofenceRequestIds != null) {
            setupLocationPendingResult(LocationServices.GeofencingApi.removeGeofences(apiClient, this.geofenceRequestIds), resultCallback);
        } else {
            setupLocationPendingResult(LocationServices.GeofencingApi.removeGeofences(apiClient, this.pendingIntent), resultCallback);
        }
    }
}
