package com.vkontakte.android.attachments;

import android.content.Context;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GiftAttachment$$Lambda$1 implements View.OnClickListener {
    private final GiftAttachment arg$1;
    private final Context arg$2;

    private GiftAttachment$$Lambda$1(GiftAttachment giftAttachment, Context context) {
        this.arg$1 = giftAttachment;
        this.arg$2 = context;
    }

    public static View.OnClickListener lambdaFactory$(GiftAttachment giftAttachment, Context context) {
        return new GiftAttachment$$Lambda$1(giftAttachment, context);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getFullView$0(this.arg$2, view);
    }
}
