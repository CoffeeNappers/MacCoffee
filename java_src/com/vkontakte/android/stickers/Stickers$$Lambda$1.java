package com.vkontakte.android.stickers;

import com.vkontakte.android.api.store.StoreHasNewItems;
import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class Stickers$$Lambda$1 implements Consumer {
    private final Stickers arg$1;

    private Stickers$$Lambda$1(Stickers stickers) {
        this.arg$1 = stickers;
    }

    public static Consumer lambdaFactory$(Stickers stickers) {
        return new Stickers$$Lambda$1(stickers);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$checkServerUpdates$1((StoreHasNewItems.Response) obj);
    }
}
