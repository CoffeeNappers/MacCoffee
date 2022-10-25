package com.patloew.rxlocation;

import android.location.Location;
import android.os.Looper;
import android.support.annotation.NonNull;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;
import io.reactivex.FlowableEmitter;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
class LocationUpdatesFlowableOnSubscribe extends RxLocationFlowableOnSubscribe<Location> {
    RxLocationListener locationListener;
    final LocationRequest locationRequest;
    final Looper looper;

    /* JADX INFO: Access modifiers changed from: protected */
    public LocationUpdatesFlowableOnSubscribe(@NonNull RxLocation rxLocation, LocationRequest locationRequest, Looper looper, Long timeout, TimeUnit timeUnit) {
        super(rxLocation, timeout, timeUnit);
        this.locationRequest = locationRequest;
        this.looper = looper;
    }

    @Override // com.patloew.rxlocation.RxLocationFlowableOnSubscribe
    protected void onGoogleApiClientReady(GoogleApiClient apiClient, FlowableEmitter<Location> emitter) {
        this.locationListener = new RxLocationListener(emitter);
        setupLocationPendingResult(LocationServices.FusedLocationApi.requestLocationUpdates(apiClient, this.locationRequest, this.locationListener, this.looper), new StatusErrorResultCallBack(emitter));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.patloew.rxlocation.RxLocationBaseOnSubscribe
    public void onUnsubscribed(GoogleApiClient apiClient) {
        LocationServices.FusedLocationApi.removeLocationUpdates(apiClient, this.locationListener);
        this.locationListener.onUnsubscribed();
        this.locationListener = null;
    }

    /* loaded from: classes2.dex */
    static class RxLocationListener implements LocationListener {
        private FlowableEmitter<Location> emitter;

        RxLocationListener(FlowableEmitter<Location> emitter) {
            this.emitter = emitter;
        }

        void onUnsubscribed() {
            this.emitter = null;
        }

        @Override // com.google.android.gms.location.LocationListener
        public void onLocationChanged(Location location) {
            if (this.emitter != null) {
                this.emitter.onNext(location);
            }
        }
    }
}
