package com.vkontakte.android.attachments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GeoAttachment$$Lambda$1 implements View.OnClickListener {
    private final GeoAttachment arg$1;

    private GeoAttachment$$Lambda$1(GeoAttachment geoAttachment) {
        this.arg$1 = geoAttachment;
    }

    public static View.OnClickListener lambdaFactory$(GeoAttachment geoAttachment) {
        return new GeoAttachment$$Lambda$1(geoAttachment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getViewForList$0(view);
    }
}
