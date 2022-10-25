package com.vk.attachpicker;

import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GraffitiActivity$$Lambda$12 implements Consumer {
    private static final GraffitiActivity$$Lambda$12 instance = new GraffitiActivity$$Lambda$12();

    private GraffitiActivity$$Lambda$12() {
    }

    public static Consumer lambdaFactory$() {
        return instance;
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        GraffitiActivity.lambda$onCreate$11((Throwable) obj);
    }
}
