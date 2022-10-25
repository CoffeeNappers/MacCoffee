package com.patloew.rxlocation;

import java.util.List;
import java.util.Locale;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public final /* synthetic */ class Geocoding$$Lambda$3 implements Callable {
    private final Geocoding arg$1;
    private final Locale arg$2;
    private final String arg$3;
    private final int arg$4;
    private final double arg$5;
    private final double arg$6;
    private final double arg$7;
    private final double arg$8;

    private Geocoding$$Lambda$3(Geocoding geocoding, Locale locale, String str, int i, double d, double d2, double d3, double d4) {
        this.arg$1 = geocoding;
        this.arg$2 = locale;
        this.arg$3 = str;
        this.arg$4 = i;
        this.arg$5 = d;
        this.arg$6 = d2;
        this.arg$7 = d3;
        this.arg$8 = d4;
    }

    public static Callable lambdaFactory$(Geocoding geocoding, Locale locale, String str, int i, double d, double d2, double d3, double d4) {
        return new Geocoding$$Lambda$3(geocoding, locale, str, i, d, d2, d3, d4);
    }

    @Override // java.util.concurrent.Callable
    public Object call() {
        List fromLocationName;
        fromLocationName = this.arg$1.getGeocoder(this.arg$2).getFromLocationName(this.arg$3, this.arg$4, this.arg$5, this.arg$6, this.arg$7, this.arg$8);
        return fromLocationName;
    }
}
