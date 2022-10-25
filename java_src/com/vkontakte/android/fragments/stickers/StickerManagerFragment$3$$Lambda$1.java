package com.vkontakte.android.fragments.stickers;

import com.vkontakte.android.fragments.stickers.StickerManagerFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StickerManagerFragment$3$$Lambda$1 implements Runnable {
    private final StickerManagerFragment.AnonymousClass3 arg$1;
    private final int arg$2;
    private final int arg$3;

    private StickerManagerFragment$3$$Lambda$1(StickerManagerFragment.AnonymousClass3 anonymousClass3, int i, int i2) {
        this.arg$1 = anonymousClass3;
        this.arg$2 = i;
        this.arg$3 = i2;
    }

    public static Runnable lambdaFactory$(StickerManagerFragment.AnonymousClass3 anonymousClass3, int i, int i2) {
        return new StickerManagerFragment$3$$Lambda$1(anonymousClass3, i, i2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$fail$0(this.arg$2, this.arg$3);
    }
}
