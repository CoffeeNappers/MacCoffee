package com.patloew.rxlocation;

import android.location.Location;
import java.util.Locale;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
final /* synthetic */ class Geocoding$$Lambda$1 implements Callable {
    private final Geocoding arg$1;
    private final Locale arg$2;
    private final Location arg$3;
    private final int arg$4;

    private Geocoding$$Lambda$1(Geocoding geocoding, Locale locale, Location location, int i) {
        this.arg$1 = geocoding;
        this.arg$2 = locale;
        this.arg$3 = location;
        this.arg$4 = i;
    }

    public static Callable lambdaFactory$(Geocoding geocoding, Locale locale, Location location, int i) {
        return new Geocoding$$Lambda$1(geocoding, locale, location, i);
    }

    @Override // java.util.concurrent.Callable
    public Object call() {
        return Geocoding.lambda$fromLocation$1(this.arg$1, this.arg$2, this.arg$3, this.arg$4);
    }
}
