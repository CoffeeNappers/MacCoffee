package com.vkontakte.android.fragments.messages;

import android.view.View;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.ListDialog;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$$Lambda$5 implements View.OnClickListener {
    private final VoidF1 arg$1;

    private DialogsFragment$$Lambda$5(VoidF1 voidF1) {
        this.arg$1 = voidF1;
    }

    public static View.OnClickListener lambdaFactory$(VoidF1 voidF1) {
        return new DialogsFragment$$Lambda$5(voidF1);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        new ListDialog.CreateNewMessageDialog().showNewDialogs(view.getContext(), view, this.arg$1);
    }
}
