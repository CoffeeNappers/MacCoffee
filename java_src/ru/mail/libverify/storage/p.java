package ru.mail.libverify.storage;

import android.content.Context;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationManager;
import android.location.LocationProvider;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.google.firebase.analytics.FirebaseAnalytics;
import java.util.List;
/* loaded from: classes3.dex */
final class p {
    private final Context a;
    @Nullable
    private final List<String> b;
    @Nullable
    private final LocationManager c;
    private int d = -1;
    private long e;
    @Nullable
    private Location f;

    public p(@NonNull Context context) {
        this.a = context;
        this.c = (LocationManager) context.getSystemService(FirebaseAnalytics.Param.LOCATION);
        Criteria criteria = new Criteria();
        criteria.setCostAllowed(false);
        this.b = this.c == null ? null : this.c.getProviders(criteria, false);
    }

    private Location b() {
        Location location;
        if (this.c == null || this.b == null || this.b.size() == 0 || !ru.mail.libverify.utils.m.b(this.a, "android.permission.ACCESS_COARSE_LOCATION")) {
            return null;
        }
        try {
            String str = null;
            Location location2 = null;
            for (String str2 : this.b) {
                Location lastKnownLocation = this.c.getLastKnownLocation(str2);
                LocationProvider provider = this.c.getProvider(str2);
                if (lastKnownLocation != null && provider != null) {
                    int accuracy = provider.getAccuracy();
                    if (this.d <= accuracy) {
                        this.d = accuracy;
                        this.e = SystemClock.elapsedRealtime();
                        location = lastKnownLocation;
                        location2 = location;
                        str = str2;
                    }
                }
                str2 = str;
                location = location2;
                location2 = location;
                str = str2;
            }
            ru.mail.libverify.utils.d.c("LocationProvider", "received new location %s using %s with accuracy %d", location2, str, Integer.valueOf(this.d));
            if (str != null) {
                return location2;
            }
            return null;
        } catch (Exception e) {
            ru.mail.libverify.utils.d.a("LocationProvider", e, "failed to updated current location", new Object[0]);
            return null;
        }
    }

    public final synchronized Location a() {
        Location location;
        if (this.f != null) {
            long elapsedRealtime = SystemClock.elapsedRealtime() - this.e;
            if (elapsedRealtime >= 0 && elapsedRealtime <= 600000) {
                ru.mail.libverify.utils.d.c("LocationProvider", "use already existing location %s", this.f);
                location = this.f;
            }
        }
        this.f = b();
        location = this.f;
        return location;
    }
}
