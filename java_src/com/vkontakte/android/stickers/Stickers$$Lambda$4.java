package com.vkontakte.android.stickers;

import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Stickers$$Lambda$4 implements Consumer {
    private static final Stickers$$Lambda$4 instance = new Stickers$$Lambda$4();

    private Stickers$$Lambda$4() {
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        Stickers.lambda$markNewItemsAsViewed$4((Throwable) obj);
    }
}
