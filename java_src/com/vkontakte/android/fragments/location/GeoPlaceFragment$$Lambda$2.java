package com.vkontakte.android.fragments.location;

import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GeoPlaceFragment$$Lambda$2 implements OnMapReadyCallback {
    private final GeoPlaceFragment arg$1;

    private GeoPlaceFragment$$Lambda$2(GeoPlaceFragment geoPlaceFragment) {
        this.arg$1 = geoPlaceFragment;
    }

    public static OnMapReadyCallback lambdaFactory$(GeoPlaceFragment geoPlaceFragment) {
        return new GeoPlaceFragment$$Lambda$2(geoPlaceFragment);
    }

    @Override // com.google.android.gms.maps.OnMapReadyCallback
    @LambdaForm.Hidden
    public void onMapReady(GoogleMap googleMap) {
        this.arg$1.lambda$onViewCreated$2(googleMap);
    }
}
