package com.vkontakte.android.fragments.location;

import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.OnMapReadyCallback;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SelectGeoPointFragment$$Lambda$1 implements OnMapReadyCallback {
    private final SelectGeoPointFragment arg$1;

    private SelectGeoPointFragment$$Lambda$1(SelectGeoPointFragment selectGeoPointFragment) {
        this.arg$1 = selectGeoPointFragment;
    }

    public static OnMapReadyCallback lambdaFactory$(SelectGeoPointFragment selectGeoPointFragment) {
        return new SelectGeoPointFragment$$Lambda$1(selectGeoPointFragment);
    }

    @Override // com.google.android.gms.maps.OnMapReadyCallback
    @LambdaForm.Hidden
    public void onMapReady(GoogleMap googleMap) {
        this.arg$1.lambda$initMap$3(googleMap);
    }
}
