package com.vk.attachpicker;

import android.graphics.Bitmap;
import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GraffitiActivity$$Lambda$11 implements Consumer {
    private final GraffitiActivity arg$1;

    private GraffitiActivity$$Lambda$11(GraffitiActivity graffitiActivity) {
        this.arg$1 = graffitiActivity;
    }

    public static Consumer lambdaFactory$(GraffitiActivity graffitiActivity) {
        return new GraffitiActivity$$Lambda$11(graffitiActivity);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$onCreate$10((Bitmap) obj);
    }
}
