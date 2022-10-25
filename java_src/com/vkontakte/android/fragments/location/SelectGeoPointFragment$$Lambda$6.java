package com.vkontakte.android.fragments.location;

import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.model.LatLng;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SelectGeoPointFragment$$Lambda$6 implements GoogleMap.OnMapClickListener {
    private final SelectGeoPointFragment arg$1;
    private final GoogleMap arg$2;

    private SelectGeoPointFragment$$Lambda$6(SelectGeoPointFragment selectGeoPointFragment, GoogleMap googleMap) {
        this.arg$1 = selectGeoPointFragment;
        this.arg$2 = googleMap;
    }

    public static GoogleMap.OnMapClickListener lambdaFactory$(SelectGeoPointFragment selectGeoPointFragment, GoogleMap googleMap) {
        return new SelectGeoPointFragment$$Lambda$6(selectGeoPointFragment, googleMap);
    }

    @Override // com.google.android.gms.maps.GoogleMap.OnMapClickListener
    @LambdaForm.Hidden
    public void onMapClick(LatLng latLng) {
        this.arg$1.lambda$null$2(this.arg$2, latLng);
    }
}
