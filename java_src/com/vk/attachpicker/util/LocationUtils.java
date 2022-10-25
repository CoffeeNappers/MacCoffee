package com.vk.attachpicker.util;

import android.content.Context;
import android.location.Location;
import android.location.LocationManager;
import android.os.Build;
import android.provider.Settings;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.location.LocationServices;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.attachpicker.Picker;
import io.reactivex.Observable;
import io.reactivex.android.schedulers.AndroidSchedulers;
import io.reactivex.schedulers.Schedulers;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public class LocationUtils {
    public static final String NO_LOCATION_PROVIDER_NAME = "NO_LOCATION";
    public static final Location NO_LOCATION = new Location(NO_LOCATION_PROVIDER_NAME);

    public static boolean isLocationEnabled() {
        Context context = Picker.getContext();
        int locationMode = 0;
        if (Build.VERSION.SDK_INT >= 19) {
            try {
                locationMode = Settings.Secure.getInt(context.getContentResolver(), "location_mode");
            } catch (Settings.SettingNotFoundException e) {
            }
            return locationMode != 0;
        }
        String locationProviders = Settings.Secure.getString(context.getContentResolver(), "location_providers_allowed");
        return !TextUtils.isEmpty(locationProviders) && !AppEventsConstants.EVENT_PARAM_VALUE_NO.equals(locationProviders);
    }

    public static Observable<Location> getLastKnownLocationRx() {
        Callable callable;
        callable = LocationUtils$$Lambda$1.instance;
        return Observable.fromCallable(callable).onErrorReturnItem(NO_LOCATION).subscribeOn(Schedulers.io()).observeOn(AndroidSchedulers.mainThread());
    }

    public static Location getLastKnownLocation() {
        if (isLocationEnabled()) {
            Location result = null;
            if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(Picker.getContext()) == 0) {
                result = getLastKnownLocation_GooglePlayServices();
            }
            if (result == null) {
                Location result2 = getLastKnownLocation_LocationManager();
                return result2;
            }
            return result;
        }
        return null;
    }

    private static Location getLastKnownLocation_LocationManager() {
        LocationManager locationManager = (LocationManager) Picker.getContext().getSystemService(FirebaseAnalytics.Param.LOCATION);
        if (locationManager != null) {
            try {
                Location lastLocation = locationManager.getLastKnownLocation("network");
                return lastLocation;
            } catch (SecurityException e) {
                return null;
            }
        }
        return null;
    }

    private static Location getLastKnownLocation_GooglePlayServices() {
        Location location = null;
        GoogleApiClient googleApiClient = new GoogleApiClient.Builder(Picker.getContext()).addApi(LocationServices.API).build();
        ConnectionResult result = googleApiClient.blockingConnect();
        if (result.isSuccess()) {
            try {
                location = LocationServices.FusedLocationApi.getLastLocation(googleApiClient);
            } catch (SecurityException e) {
            } catch (Exception e2) {
            } finally {
                googleApiClient.disconnect();
            }
        }
        return location;
    }
}
