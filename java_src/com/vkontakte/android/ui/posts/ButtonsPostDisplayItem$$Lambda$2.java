package com.vkontakte.android.ui.posts;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ButtonsPostDisplayItem$$Lambda$2 implements View.OnClickListener {
    private final ButtonsPostDisplayItem arg$1;

    private ButtonsPostDisplayItem$$Lambda$2(ButtonsPostDisplayItem buttonsPostDisplayItem) {
        this.arg$1 = buttonsPostDisplayItem;
    }

    public static View.OnClickListener lambdaFactory$(ButtonsPostDisplayItem buttonsPostDisplayItem) {
        return new ButtonsPostDisplayItem$$Lambda$2(buttonsPostDisplayItem);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onBindView$2(view);
    }
}
