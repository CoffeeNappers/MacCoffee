package com.patloew.rxlocation;

import android.support.annotation.NonNull;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.LocationServices;
import io.reactivex.SingleEmitter;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
class LocationFlushSingleOnSubscribe extends RxLocationSingleOnSubscribe<Status> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationFlushSingleOnSubscribe(@NonNull RxLocation rxLocation, Long timeout, TimeUnit timeUnit) {
        super(rxLocation, timeout, timeUnit);
    }

    @Override // com.patloew.rxlocation.RxLocationSingleOnSubscribe
    protected void onGoogleApiClientReady(GoogleApiClient apiClient, SingleEmitter<Status> emitter) {
        setupLocationPendingResult(LocationServices.FusedLocationApi.flushLocations(apiClient), SingleResultCallBack.get(emitter));
    }
}
