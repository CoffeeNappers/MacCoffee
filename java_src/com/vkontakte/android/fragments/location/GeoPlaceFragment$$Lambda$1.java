package com.vkontakte.android.fragments.location;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GeoPlaceFragment$$Lambda$1 implements View.OnClickListener {
    private final GeoPlaceFragment arg$1;

    private GeoPlaceFragment$$Lambda$1(GeoPlaceFragment geoPlaceFragment) {
        this.arg$1 = geoPlaceFragment;
    }

    public static View.OnClickListener lambdaFactory$(GeoPlaceFragment geoPlaceFragment) {
        return new GeoPlaceFragment$$Lambda$1(geoPlaceFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onViewCreated$1(view);
    }
}
