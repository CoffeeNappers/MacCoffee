package com.vkontakte.android.stickers;

import com.vkontakte.android.api.store.StoreHasNewItems;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class Stickers$$Lambda$7 implements Runnable {
    private final Stickers arg$1;
    private final StoreHasNewItems.Response arg$2;

    private Stickers$$Lambda$7(Stickers stickers, StoreHasNewItems.Response response) {
        this.arg$1 = stickers;
        this.arg$2 = response;
    }

    public static Runnable lambdaFactory$(Stickers stickers, StoreHasNewItems.Response response) {
        return new Stickers$$Lambda$7(stickers, response);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0(this.arg$2);
    }
}
