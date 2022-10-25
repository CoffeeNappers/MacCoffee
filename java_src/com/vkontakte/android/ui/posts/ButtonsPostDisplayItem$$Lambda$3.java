package com.vkontakte.android.ui.posts;

import android.content.DialogInterface;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ButtonsPostDisplayItem$$Lambda$3 implements DialogInterface.OnClickListener {
    private final ButtonsPostDisplayItem arg$1;
    private final View arg$2;

    private ButtonsPostDisplayItem$$Lambda$3(ButtonsPostDisplayItem buttonsPostDisplayItem, View view) {
        this.arg$1 = buttonsPostDisplayItem;
        this.arg$2 = view;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ButtonsPostDisplayItem buttonsPostDisplayItem, View view) {
        return new ButtonsPostDisplayItem$$Lambda$3(buttonsPostDisplayItem, view);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$null$1(this.arg$2, dialogInterface, i);
    }
}
