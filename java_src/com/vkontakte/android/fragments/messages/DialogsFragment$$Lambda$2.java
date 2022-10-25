package com.vkontakte.android.fragments.messages;

import android.view.LayoutInflater;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$$Lambda$2 implements View.OnClickListener {
    private final DialogsFragment arg$1;
    private final LayoutInflater arg$2;

    private DialogsFragment$$Lambda$2(DialogsFragment dialogsFragment, LayoutInflater layoutInflater) {
        this.arg$1 = dialogsFragment;
        this.arg$2 = layoutInflater;
    }

    public static View.OnClickListener lambdaFactory$(DialogsFragment dialogsFragment, LayoutInflater layoutInflater) {
        return new DialogsFragment$$Lambda$2(dialogsFragment, layoutInflater);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateContentView$1(this.arg$2, view);
    }
}
