package com.patloew.rxlocation;

import android.content.Context;
import android.support.annotation.NonNull;
import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public class RxLocation {
    final Context ctx;
    private final Geocoding geocoding;
    private final ActivityRecognition activityRecognition = new ActivityRecognition(this);
    private final FusedLocation fusedLocation = new FusedLocation(this);
    private final Geofencing geofencing = new Geofencing(this);
    private final LocationSettings locationSettings = new LocationSettings(this);
    Long timeoutTime = null;
    TimeUnit timeoutUnit = null;

    public RxLocation(@NonNull Context ctx) {
        this.ctx = ctx.getApplicationContext();
        this.geocoding = new Geocoding(ctx.getApplicationContext());
    }

    public void setDefaultTimeout(long time, @NonNull TimeUnit timeUnit) {
        if (timeUnit != null) {
            this.timeoutTime = Long.valueOf(time);
            this.timeoutUnit = timeUnit;
            return;
        }
        throw new IllegalArgumentException("timeUnit parameter must not be null");
    }

    public void resetDefaultTimeout() {
        this.timeoutTime = null;
        this.timeoutUnit = null;
    }

    public ActivityRecognition activity() {
        return this.activityRecognition;
    }

    public Geocoding geocoding() {
        return this.geocoding;
    }

    public Geofencing geofencing() {
        return this.geofencing;
    }

    public FusedLocation location() {
        return this.fusedLocation;
    }

    public LocationSettings settings() {
        return this.locationSettings;
    }
}
