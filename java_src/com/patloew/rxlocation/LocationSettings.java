package com.patloew.rxlocation;

import android.support.annotation.NonNull;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationSettingsRequest;
import com.google.android.gms.location.LocationSettingsResult;
import io.reactivex.Completable;
import io.reactivex.Single;
import io.reactivex.functions.Function;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class LocationSettings {
    private static final Function<Boolean, Completable> CHECK_SETTINGS_COMPLETABLE_FUNCTION = LocationSettings$$Lambda$1.lambdaFactory$();
    private final RxLocation rxLocation;

    /* JADX INFO: Access modifiers changed from: package-private */
    public LocationSettings(RxLocation rxLocation) {
        this.rxLocation = rxLocation;
    }

    LocationSettingsRequest.Builder getLocationSettingsRequestBuilder() {
        return new LocationSettingsRequest.Builder();
    }

    public Single<LocationSettingsResult> check(@NonNull LocationRequest locationRequest) {
        return checkInternal(getLocationSettingsRequestBuilder().addLocationRequest(locationRequest).build(), null, null);
    }

    public Single<LocationSettingsResult> check(@NonNull LocationRequest locationRequest, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return checkInternal(getLocationSettingsRequestBuilder().addLocationRequest(locationRequest).build(), Long.valueOf(timeoutTime), timeoutUnit);
    }

    public Single<LocationSettingsResult> check(@NonNull LocationSettingsRequest locationSettingsRequest) {
        return checkInternal(locationSettingsRequest, null, null);
    }

    public Single<LocationSettingsResult> check(@NonNull LocationSettingsRequest locationSettingsRequest, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return checkInternal(locationSettingsRequest, Long.valueOf(timeoutTime), timeoutUnit);
    }

    private Single<LocationSettingsResult> checkInternal(LocationSettingsRequest locationSettingsRequest, Long timeoutTime, TimeUnit timeoutUnit) {
        return Single.create(new SettingsCheckSingleOnSubscribe(this.rxLocation, locationSettingsRequest, timeoutTime, timeoutUnit));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static /* synthetic */ Completable lambda$static$0(Boolean success) throws Exception {
        return success.booleanValue() ? Completable.complete() : Completable.error(new LocationSettingsNotSatisfiedException());
    }

    public Completable checkAndHandleResolutionCompletable(@NonNull LocationRequest locationRequest) {
        return checkAndHandleResolution(locationRequest).flatMapCompletable(CHECK_SETTINGS_COMPLETABLE_FUNCTION);
    }

    public Single<Boolean> checkAndHandleResolution(@NonNull LocationRequest locationRequest) {
        return checkAndHandleResolutionInternal(getLocationSettingsRequestBuilder().addLocationRequest(locationRequest).build(), null, null);
    }

    public Completable checkAndHandleResolutionCompletable(@NonNull LocationRequest locationRequest, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return checkAndHandleResolution(locationRequest, timeoutTime, timeoutUnit).flatMapCompletable(CHECK_SETTINGS_COMPLETABLE_FUNCTION);
    }

    public Single<Boolean> checkAndHandleResolution(@NonNull LocationRequest locationRequest, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return checkAndHandleResolutionInternal(getLocationSettingsRequestBuilder().addLocationRequest(locationRequest).build(), Long.valueOf(timeoutTime), timeoutUnit);
    }

    public Completable checkAndHandleResolutionCompletable(@NonNull LocationSettingsRequest locationSettingsRequest) {
        return checkAndHandleResolutionInternal(locationSettingsRequest, null, null).flatMapCompletable(CHECK_SETTINGS_COMPLETABLE_FUNCTION);
    }

    public Single<Boolean> checkAndHandleResolution(@NonNull LocationSettingsRequest locationSettingsRequest) {
        return checkAndHandleResolutionInternal(locationSettingsRequest, null, null);
    }

    public Completable checkAndHandleResolutionCompletable(@NonNull LocationSettingsRequest locationSettingsRequest, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return checkAndHandleResolutionInternal(locationSettingsRequest, Long.valueOf(timeoutTime), timeoutUnit).flatMapCompletable(CHECK_SETTINGS_COMPLETABLE_FUNCTION);
    }

    public Single<Boolean> checkAndHandleResolution(@NonNull LocationSettingsRequest locationSettingsRequest, long timeoutTime, @NonNull TimeUnit timeoutUnit) {
        return checkAndHandleResolutionInternal(locationSettingsRequest, Long.valueOf(timeoutTime), timeoutUnit);
    }

    private Single<Boolean> checkAndHandleResolutionInternal(LocationSettingsRequest locationSettingsRequest, Long timeoutTime, TimeUnit timeoutUnit) {
        return Single.create(new SettingsCheckHandleSingleOnSubscribe(this.rxLocation, locationSettingsRequest, timeoutTime, timeoutUnit));
    }
}
