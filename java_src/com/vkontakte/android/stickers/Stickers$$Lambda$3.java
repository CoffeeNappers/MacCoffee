package com.vkontakte.android.stickers;

import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Stickers$$Lambda$3 implements Consumer {
    private final Stickers arg$1;

    private Stickers$$Lambda$3(Stickers stickers) {
        this.arg$1 = stickers;
    }

    public static Consumer lambdaFactory$(Stickers stickers) {
        return new Stickers$$Lambda$3(stickers);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$markNewItemsAsViewed$3(obj);
    }
}
