package com.patloew.rxlocation;

import java.util.List;
import java.util.Locale;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public final /* synthetic */ class Geocoding$$Lambda$2 implements Callable {
    private final Geocoding arg$1;
    private final Locale arg$2;
    private final double arg$3;
    private final double arg$4;
    private final int arg$5;

    private Geocoding$$Lambda$2(Geocoding geocoding, Locale locale, double d, double d2, int i) {
        this.arg$1 = geocoding;
        this.arg$2 = locale;
        this.arg$3 = d;
        this.arg$4 = d2;
        this.arg$5 = i;
    }

    public static Callable lambdaFactory$(Geocoding geocoding, Locale locale, double d, double d2, int i) {
        return new Geocoding$$Lambda$2(geocoding, locale, d, d2, i);
    }

    @Override // java.util.concurrent.Callable
    public Object call() {
        List fromLocation;
        fromLocation = this.arg$1.getGeocoder(this.arg$2).getFromLocation(this.arg$3, this.arg$4, this.arg$5);
        return fromLocation;
    }
}
