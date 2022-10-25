package com.my.tracker.providers;

import android.content.Context;
import android.location.Location;
import android.location.LocationManager;
import android.os.Looper;
import com.google.firebase.analytics.FirebaseAnalytics;
/* compiled from: LocationDataProvider.java */
/* loaded from: classes2.dex */
public final class g extends a {
    private Location a;
    private String b;
    private boolean c = true;

    public final void b(Context context) {
        Location lastKnownLocation;
        Location location;
        float f;
        long j;
        String str = null;
        if (com.my.tracker.utils.d.a("android.permission.ACCESS_FINE_LOCATION", context) && com.my.tracker.utils.d.a("android.permission.ACCESS_COARSE_LOCATION", context) && !com.my.tracker.utils.d.a()) {
            if (Looper.myLooper() == Looper.getMainLooper()) {
                com.my.tracker.a.a("LocationDataProvider: You must not call collectData method from main thread");
                return;
            }
            this.a = null;
            this.b = null;
            if (this.c) {
                float f2 = Float.MAX_VALUE;
                long j2 = 0;
                LocationManager locationManager = (LocationManager) context.getSystemService(FirebaseAnalytics.Param.LOCATION);
                Location location2 = null;
                for (String str2 : locationManager.getAllProviders()) {
                    try {
                        lastKnownLocation = locationManager.getLastKnownLocation(str2);
                    } catch (SecurityException e) {
                        com.my.tracker.a.a("Permission android.permission.ACCESS_COARSE_LOCATION or android.permission.ACCESS_FINE_LOCATION check was positive, but still got security exception on the location provider");
                    }
                    if (lastKnownLocation != null) {
                        float accuracy = lastKnownLocation.getAccuracy();
                        long time = lastKnownLocation.getTime();
                        if (location2 == null || (time > j2 && accuracy < f2)) {
                            location = lastKnownLocation;
                            f = accuracy;
                            j = time;
                            j2 = j;
                            f2 = f;
                            location2 = location;
                            str = str2;
                        }
                    }
                    str2 = str;
                    location = location2;
                    f = f2;
                    j = j2;
                    j2 = j;
                    f2 = f;
                    location2 = location;
                    str = str2;
                }
                if (location2 != null) {
                    this.a = location2;
                    this.b = str;
                }
            }
        }
    }

    public final void a(com.my.tracker.builders.a aVar) {
        if (this.a != null) {
            aVar.a(this.a, this.b);
        }
    }

    public final void a(boolean z) {
        this.c = z;
    }
}
