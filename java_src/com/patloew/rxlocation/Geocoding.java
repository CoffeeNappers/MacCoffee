package com.patloew.rxlocation;

import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.support.annotation.NonNull;
import io.reactivex.Maybe;
import io.reactivex.Single;
import io.reactivex.functions.Function;
import java.util.List;
import java.util.Locale;
/* loaded from: classes2.dex */
public class Geocoding {
    private static final Function<List<Address>, Maybe<Address>> ADDRESS_MAYBE_FUNCTION = Geocoding$$Lambda$5.lambdaFactory$();
    private final Context context;

    public static /* synthetic */ Maybe lambda$static$0(List addresses) throws Exception {
        return addresses.isEmpty() ? Maybe.empty() : Maybe.just(addresses.get(0));
    }

    public Geocoding(Context context) {
        this.context = context;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Geocoder getGeocoder(Locale locale) {
        return locale != null ? new Geocoder(this.context, locale) : new Geocoder(this.context);
    }

    public Maybe<Address> fromLocation(@NonNull Location location) {
        return fromLocation((Locale) null, location, 1).flatMapMaybe(ADDRESS_MAYBE_FUNCTION);
    }

    public Maybe<Address> fromLocation(Locale locale, @NonNull Location location) {
        return fromLocation(locale, location, 1).flatMapMaybe(ADDRESS_MAYBE_FUNCTION);
    }

    public Single<List<Address>> fromLocation(@NonNull Location location, int maxResults) {
        return fromLocation((Locale) null, location, maxResults);
    }

    public Single<List<Address>> fromLocation(Locale locale, @NonNull Location location, int maxResults) {
        return Single.fromCallable(Geocoding$$Lambda$1.lambdaFactory$(this, locale, location, maxResults));
    }

    public Maybe<Address> fromLocation(double latitude, double longitude) {
        return fromLocation(null, latitude, longitude, 1).flatMapMaybe(ADDRESS_MAYBE_FUNCTION);
    }

    public Maybe<Address> fromLocation(Locale locale, double latitude, double longitude) {
        return fromLocation(locale, latitude, longitude, 1).flatMapMaybe(ADDRESS_MAYBE_FUNCTION);
    }

    public Single<List<Address>> fromLocation(double latitude, double longitude, int maxResults) {
        return fromLocation(null, latitude, longitude, maxResults);
    }

    public Single<List<Address>> fromLocation(Locale locale, double latitude, double longitude, int maxResults) {
        return Single.fromCallable(Geocoding$$Lambda$2.lambdaFactory$(this, locale, latitude, longitude, maxResults));
    }

    public Maybe<Address> fromLocationName(@NonNull String locationName, double lowerLeftLatitude, double lowerLeftLongitude, double upperRightLatitude, double upperRightLongitude) {
        return fromLocationName(null, locationName, 1, lowerLeftLatitude, lowerLeftLongitude, upperRightLatitude, upperRightLongitude).flatMapMaybe(ADDRESS_MAYBE_FUNCTION);
    }

    public Maybe<Address> fromLocationName(Locale locale, @NonNull String locationName, double lowerLeftLatitude, double lowerLeftLongitude, double upperRightLatitude, double upperRightLongitude) {
        return fromLocationName(locale, locationName, 1, lowerLeftLatitude, lowerLeftLongitude, upperRightLatitude, upperRightLongitude).flatMapMaybe(ADDRESS_MAYBE_FUNCTION);
    }

    public Single<List<Address>> fromLocationName(@NonNull String locationName, int maxResults, double lowerLeftLatitude, double lowerLeftLongitude, double upperRightLatitude, double upperRightLongitude) {
        return fromLocationName(null, locationName, maxResults, lowerLeftLatitude, lowerLeftLongitude, upperRightLatitude, upperRightLongitude);
    }

    public Single<List<Address>> fromLocationName(Locale locale, @NonNull String locationName, int maxResults, double lowerLeftLatitude, double lowerLeftLongitude, double upperRightLatitude, double upperRightLongitude) {
        return Single.fromCallable(Geocoding$$Lambda$3.lambdaFactory$(this, locale, locationName, maxResults, lowerLeftLatitude, lowerLeftLongitude, upperRightLatitude, upperRightLongitude));
    }

    public Maybe<Address> fromLocationName(@NonNull String locationName) {
        return fromLocationName(null, locationName, 1).flatMapMaybe(ADDRESS_MAYBE_FUNCTION);
    }

    public Maybe<Address> fromLocationName(Locale locale, @NonNull String locationName) {
        return fromLocationName(locale, locationName, 1).flatMapMaybe(ADDRESS_MAYBE_FUNCTION);
    }

    public Single<List<Address>> fromLocationName(@NonNull String locationName, int maxResults) {
        return fromLocationName(null, locationName, maxResults);
    }

    public Single<List<Address>> fromLocationName(Locale locale, @NonNull String locationName, int maxResults) {
        return Single.fromCallable(Geocoding$$Lambda$4.lambdaFactory$(this, locale, locationName, maxResults));
    }
}
