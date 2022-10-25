package com.vkontakte.android.fragments.messages;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$$Lambda$3 implements View.OnClickListener {
    private final DialogsFragment arg$1;

    private DialogsFragment$$Lambda$3(DialogsFragment dialogsFragment) {
        this.arg$1 = dialogsFragment;
    }

    public static View.OnClickListener lambdaFactory$(DialogsFragment dialogsFragment) {
        return new DialogsFragment$$Lambda$3(dialogsFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateContentView$2(view);
    }
}
