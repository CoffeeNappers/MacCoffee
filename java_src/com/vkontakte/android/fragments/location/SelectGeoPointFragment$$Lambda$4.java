package com.vkontakte.android.fragments.location;

import android.location.Location;
import com.google.android.gms.maps.GoogleMap;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SelectGeoPointFragment$$Lambda$4 implements GoogleMap.OnMyLocationChangeListener {
    private final SelectGeoPointFragment arg$1;
    private final GoogleMap arg$2;

    private SelectGeoPointFragment$$Lambda$4(SelectGeoPointFragment selectGeoPointFragment, GoogleMap googleMap) {
        this.arg$1 = selectGeoPointFragment;
        this.arg$2 = googleMap;
    }

    public static GoogleMap.OnMyLocationChangeListener lambdaFactory$(SelectGeoPointFragment selectGeoPointFragment, GoogleMap googleMap) {
        return new SelectGeoPointFragment$$Lambda$4(selectGeoPointFragment, googleMap);
    }

    @Override // com.google.android.gms.maps.GoogleMap.OnMyLocationChangeListener
    @LambdaForm.Hidden
    public void onMyLocationChange(Location location) {
        this.arg$1.lambda$null$0(this.arg$2, location);
    }
}
