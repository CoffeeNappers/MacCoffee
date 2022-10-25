package com.vkontakte.android.fragments.gifts;

import android.content.DialogInterface;
import com.vkontakte.android.api.models.GiftItem;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileGiftsFragment$$Lambda$2 implements DialogInterface.OnClickListener {
    private final ProfileGiftsFragment arg$1;
    private final GiftItem arg$2;

    private ProfileGiftsFragment$$Lambda$2(ProfileGiftsFragment profileGiftsFragment, GiftItem giftItem) {
        this.arg$1 = profileGiftsFragment;
        this.arg$2 = giftItem;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ProfileGiftsFragment profileGiftsFragment, GiftItem giftItem) {
        return new ProfileGiftsFragment$$Lambda$2(profileGiftsFragment, giftItem);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showGiftDeleteDialog$1(this.arg$2, dialogInterface, i);
    }
}
