package com.vkontakte.android.stickers;

import android.view.View;
import com.vkontakte.android.stickers.StickerPage;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StickerPage$HeaderHolder$$Lambda$1 implements View.OnClickListener {
    private final StickerPage.HeaderHolder arg$1;

    private StickerPage$HeaderHolder$$Lambda$1(StickerPage.HeaderHolder headerHolder) {
        this.arg$1 = headerHolder;
    }

    public static View.OnClickListener lambdaFactory$(StickerPage.HeaderHolder headerHolder) {
        return new StickerPage$HeaderHolder$$Lambda$1(headerHolder);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$1(view);
    }
}
