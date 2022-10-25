package com.vkontakte.android.fragments.stickers;

import android.content.DialogInterface;
import com.vkontakte.android.fragments.stickers.StickerManagerFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StickerManagerFragment$Holder$$Lambda$1 implements DialogInterface.OnClickListener {
    private final StickerManagerFragment.Holder arg$1;

    private StickerManagerFragment$Holder$$Lambda$1(StickerManagerFragment.Holder holder) {
        this.arg$1 = holder;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(StickerManagerFragment.Holder holder) {
        return new StickerManagerFragment$Holder$$Lambda$1(holder);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onClick$0(dialogInterface, i);
    }
}
