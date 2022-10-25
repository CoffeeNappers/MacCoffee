package com.vkontakte.android.stickers;

import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Stickers$$Lambda$6 implements Consumer {
    private static final Stickers$$Lambda$6 instance = new Stickers$$Lambda$6();

    private Stickers$$Lambda$6() {
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        Stickers.lambda$markGlobalPromotionsAsViewed$6((Throwable) obj);
    }
}
