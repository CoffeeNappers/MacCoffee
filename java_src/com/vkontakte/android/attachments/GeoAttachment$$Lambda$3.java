package com.vkontakte.android.attachments;

import android.content.Context;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GeoAttachment$$Lambda$3 implements View.OnClickListener {
    private final GeoAttachment arg$1;
    private final Context arg$2;

    private GeoAttachment$$Lambda$3(GeoAttachment geoAttachment, Context context) {
        this.arg$1 = geoAttachment;
        this.arg$2 = context;
    }

    public static View.OnClickListener lambdaFactory$(GeoAttachment geoAttachment, Context context) {
        return new GeoAttachment$$Lambda$3(geoAttachment, context);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getViewForList$2(this.arg$2, view);
    }
}
