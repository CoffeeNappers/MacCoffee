package com.vkontakte.android.fragments.location;

import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CheckInFragment$$Lambda$1 implements OnMapReadyCallback {
    private final CheckInFragment arg$1;

    private CheckInFragment$$Lambda$1(CheckInFragment checkInFragment) {
        this.arg$1 = checkInFragment;
    }

    public static OnMapReadyCallback lambdaFactory$(CheckInFragment checkInFragment) {
        return new CheckInFragment$$Lambda$1(checkInFragment);
    }

    @Override // com.google.android.gms.maps.OnMapReadyCallback
    @LambdaForm.Hidden
    public void onMapReady(GoogleMap googleMap) {
        this.arg$1.lambda$initMap$1(googleMap);
    }
}
