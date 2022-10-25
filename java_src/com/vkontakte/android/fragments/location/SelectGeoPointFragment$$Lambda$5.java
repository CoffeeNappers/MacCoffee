package com.vkontakte.android.fragments.location;

import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.model.CameraPosition;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SelectGeoPointFragment$$Lambda$5 implements GoogleMap.OnCameraChangeListener {
    private final SelectGeoPointFragment arg$1;

    private SelectGeoPointFragment$$Lambda$5(SelectGeoPointFragment selectGeoPointFragment) {
        this.arg$1 = selectGeoPointFragment;
    }

    public static GoogleMap.OnCameraChangeListener lambdaFactory$(SelectGeoPointFragment selectGeoPointFragment) {
        return new SelectGeoPointFragment$$Lambda$5(selectGeoPointFragment);
    }

    @Override // com.google.android.gms.maps.GoogleMap.OnCameraChangeListener
    @LambdaForm.Hidden
    public void onCameraChange(CameraPosition cameraPosition) {
        this.arg$1.lambda$null$1(cameraPosition);
    }
}
