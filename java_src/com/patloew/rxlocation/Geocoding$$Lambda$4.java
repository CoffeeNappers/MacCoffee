package com.patloew.rxlocation;

import java.util.List;
import java.util.Locale;
import java.util.concurrent.Callable;
/* loaded from: classes2.dex */
public final /* synthetic */ class Geocoding$$Lambda$4 implements Callable {
    private final Geocoding arg$1;
    private final Locale arg$2;
    private final String arg$3;
    private final int arg$4;

    private Geocoding$$Lambda$4(Geocoding geocoding, Locale locale, String str, int i) {
        this.arg$1 = geocoding;
        this.arg$2 = locale;
        this.arg$3 = str;
        this.arg$4 = i;
    }

    public static Callable lambdaFactory$(Geocoding geocoding, Locale locale, String str, int i) {
        return new Geocoding$$Lambda$4(geocoding, locale, str, i);
    }

    @Override // java.util.concurrent.Callable
    public Object call() {
        List fromLocationName;
        fromLocationName = this.arg$1.getGeocoder(this.arg$2).getFromLocationName(this.arg$3, this.arg$4);
        return fromLocationName;
    }
}
