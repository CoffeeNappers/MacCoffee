package com.vkontakte.android.stickers;

import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class Stickers$$Lambda$2 implements Consumer {
    private static final Stickers$$Lambda$2 instance = new Stickers$$Lambda$2();

    private Stickers$$Lambda$2() {
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        Stickers.lambda$checkServerUpdates$2((Throwable) obj);
    }
}
