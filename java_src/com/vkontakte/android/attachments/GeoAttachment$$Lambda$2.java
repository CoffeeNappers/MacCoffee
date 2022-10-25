package com.vkontakte.android.attachments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GeoAttachment$$Lambda$2 implements View.OnClickListener {
    private final GeoAttachment arg$1;

    private GeoAttachment$$Lambda$2(GeoAttachment geoAttachment) {
        this.arg$1 = geoAttachment;
    }

    public static View.OnClickListener lambdaFactory$(GeoAttachment geoAttachment) {
        return new GeoAttachment$$Lambda$2(geoAttachment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getViewForList$1(view);
    }
}
