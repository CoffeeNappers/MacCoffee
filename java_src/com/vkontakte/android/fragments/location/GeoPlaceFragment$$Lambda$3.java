package com.vkontakte.android.fragments.location;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GeoPlaceFragment$$Lambda$3 implements DialogInterface.OnClickListener {
    private final GeoPlaceFragment arg$1;

    private GeoPlaceFragment$$Lambda$3(GeoPlaceFragment geoPlaceFragment) {
        this.arg$1 = geoPlaceFragment;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(GeoPlaceFragment geoPlaceFragment) {
        return new GeoPlaceFragment$$Lambda$3(geoPlaceFragment);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$null$0(dialogInterface, i);
    }
}
