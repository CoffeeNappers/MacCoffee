package com.patloew.rxlocation;

import android.app.PendingIntent;
import android.location.Location;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.RequiresPermission;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.LocationRequest;
import io.reactivex.BackpressureStrategy;
import io.reactivex.Flowable;
import io.reactivex.Maybe;
import io.reactivex.Observable;
import io.reactivex.Single;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class FusedLocation {
    private final RxLocation rxLocation;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FusedLocation(RxLocation rxLocation) {
        this.rxLocation = rxLocation;
    }

    public Single<Status> flush() {
        return flushInternal(null, null);
    }

    public Single<Status> flush(long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return flushInternal(Long.valueOf(timeoutTime), timeoutUnit);
    }

    private Single<Status> flushInternal(Long timeoutTime, TimeUnit timeoutUnit) {
        return Single.create(new LocationFlushSingleOnSubscribe(this.rxLocation, timeoutTime, timeoutUnit));
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Maybe<Location> lastLocation() {
        return Maybe.create(new LocationLastMaybeOnSubscribe(this.rxLocation));
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Single<Boolean> isLocationAvailable() {
        return Single.create(new LocationAvailabilitySingleOnSubscribe(this.rxLocation));
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Observable<Location> updates(@NonNull LocationRequest locationRequest) {
        return updatesInternal(locationRequest, null, null, null, BackpressureStrategy.MISSING).toObservable();
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Observable<Location> updates(@NonNull LocationRequest locationRequest, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return updatesInternal(locationRequest, null, Long.valueOf(timeoutTime), timeoutUnit, BackpressureStrategy.MISSING).toObservable();
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Observable<Location> updates(@NonNull LocationRequest locationRequest, @NonNull Looper looper) {
        return updatesInternal(locationRequest, looper, null, null, BackpressureStrategy.MISSING).toObservable();
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Observable<Location> updates(@NonNull LocationRequest locationRequest, @NonNull Looper looper, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return updatesInternal(locationRequest, looper, Long.valueOf(timeoutTime), timeoutUnit, BackpressureStrategy.MISSING).toObservable();
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Flowable<Location> updates(@NonNull LocationRequest locationRequest, BackpressureStrategy backpressureStrategy) {
        return updatesInternal(locationRequest, null, null, null, backpressureStrategy);
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Flowable<Location> updates(@NonNull LocationRequest locationRequest, long timeoutTime, @NonNull TimeUnit timeoutUnit, BackpressureStrategy backpressureStrategy) {
        return updatesInternal(locationRequest, null, Long.valueOf(timeoutTime), timeoutUnit, backpressureStrategy);
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Flowable<Location> updates(@NonNull LocationRequest locationRequest, @NonNull Looper looper, BackpressureStrategy backpressureStrategy) {
        return updatesInternal(locationRequest, looper, null, null, backpressureStrategy);
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Flowable<Location> updates(@NonNull LocationRequest locationRequest, @NonNull Looper looper, long timeoutTime, @NonNull TimeUnit timeoutUnit, BackpressureStrategy backpressureStrategy) {
        return updatesInternal(locationRequest, looper, Long.valueOf(timeoutTime), timeoutUnit, backpressureStrategy);
    }

    private Flowable<Location> updatesInternal(LocationRequest locationRequest, Looper looper, Long timeoutTime, TimeUnit timeoutUnit, BackpressureStrategy backpressureStrategy) {
        return Flowable.create(new LocationUpdatesFlowableOnSubscribe(this.rxLocation, locationRequest, looper, timeoutTime, timeoutUnit), backpressureStrategy);
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Single<Status> requestUpdates(@NonNull LocationRequest locationRequest, @NonNull PendingIntent pendingIntent) {
        return requestUpdatesInternal(locationRequest, pendingIntent, null, null);
    }

    @RequiresPermission(anyOf = {"android.permission.ACCESS_COARSE_LOCATION", "android.permission.ACCESS_FINE_LOCATION"})
    public Single<Status> requestUpdates(@NonNull LocationRequest locationRequest, @NonNull PendingIntent pendingIntent, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return requestUpdatesInternal(locationRequest, pendingIntent, Long.valueOf(timeoutTime), timeoutUnit);
    }

    private Single<Status> requestUpdatesInternal(LocationRequest locationRequest, PendingIntent pendingIntent, Long timeoutTime, TimeUnit timeoutUnit) {
        return Single.create(new LocationRequestUpdatesSingleOnSubscribe(this.rxLocation, locationRequest, pendingIntent, timeoutTime, timeoutUnit));
    }

    public Single<Status> removeUpdates(@NonNull PendingIntent pendingIntent) {
        return removeUpdatesInternal(pendingIntent, null, null);
    }

    public Single<Status> removeUpdates(@NonNull PendingIntent pendingIntent, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return removeUpdatesInternal(pendingIntent, Long.valueOf(timeoutTime), timeoutUnit);
    }

    private Single<Status> removeUpdatesInternal(PendingIntent pendingIntent, Long timeoutTime, TimeUnit timeoutUnit) {
        return Single.create(new LocationRemoveUpdatesSingleOnSubscribe(this.rxLocation, pendingIntent, timeoutTime, timeoutUnit));
    }
}
