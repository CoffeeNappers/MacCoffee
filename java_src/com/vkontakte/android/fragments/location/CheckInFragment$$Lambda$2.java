package com.vkontakte.android.fragments.location;

import android.location.Location;
import com.google.android.gms.maps.GoogleMap;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CheckInFragment$$Lambda$2 implements GoogleMap.OnMyLocationChangeListener {
    private final CheckInFragment arg$1;
    private final GoogleMap arg$2;

    private CheckInFragment$$Lambda$2(CheckInFragment checkInFragment, GoogleMap googleMap) {
        this.arg$1 = checkInFragment;
        this.arg$2 = googleMap;
    }

    public static GoogleMap.OnMyLocationChangeListener lambdaFactory$(CheckInFragment checkInFragment, GoogleMap googleMap) {
        return new CheckInFragment$$Lambda$2(checkInFragment, googleMap);
    }

    @Override // com.google.android.gms.maps.GoogleMap.OnMyLocationChangeListener
    @LambdaForm.Hidden
    public void onMyLocationChange(Location location) {
        this.arg$1.lambda$null$0(this.arg$2, location);
    }
}
