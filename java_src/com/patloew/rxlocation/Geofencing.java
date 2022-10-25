package com.patloew.rxlocation;

import android.app.PendingIntent;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.GeofencingRequest;
import io.reactivex.Single;
import java.util.List;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class Geofencing {
    private final RxLocation rxLocation;

    /* JADX INFO: Access modifiers changed from: package-private */
    public Geofencing(RxLocation rxLocation) {
        this.rxLocation = rxLocation;
    }

    @RequiresPermission("android.permission.ACCESS_FINE_LOCATION")
    public Single<Status> add(@NonNull GeofencingRequest geofencingRequest, @NonNull PendingIntent pendingIntent) {
        return addInternal(geofencingRequest, pendingIntent, null, null);
    }

    @RequiresPermission("android.permission.ACCESS_FINE_LOCATION")
    public Single<Status> add(@NonNull GeofencingRequest geofencingRequest, @NonNull PendingIntent pendingIntent, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return addInternal(geofencingRequest, pendingIntent, Long.valueOf(timeoutTime), timeoutUnit);
    }

    private Single<Status> addInternal(GeofencingRequest geofencingRequest, PendingIntent pendingIntent, Long timeoutTime, TimeUnit timeoutUnit) {
        return Single.create(new GeofencingAddSingleOnSubscribe(this.rxLocation, geofencingRequest, pendingIntent, timeoutTime, timeoutUnit));
    }

    public Single<Status> remove(@NonNull List<String> geofenceRequestIds) {
        return removeInternal(geofenceRequestIds, null, null, null);
    }

    public Single<Status> remove(@NonNull List<String> geofenceRequestIds, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return removeInternal(geofenceRequestIds, null, Long.valueOf(timeoutTime), timeoutUnit);
    }

    public Single<Status> remove(@NonNull PendingIntent pendingIntent) {
        return removeInternal(null, pendingIntent, null, null);
    }

    public Single<Status> remove(@NonNull PendingIntent pendingIntent, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return removeInternal(null, pendingIntent, Long.valueOf(timeoutTime), timeoutUnit);
    }

    private Single<Status> removeInternal(List<String> geofenceRequestIds, PendingIntent pendingIntent, Long timeoutTime, TimeUnit timeoutUnit) {
        return Single.create(new GeofencingRemoveSingleOnSubscribe(this.rxLocation, geofenceRequestIds, pendingIntent, timeoutTime, timeoutUnit));
    }
}
