package com.vkontakte.android.fragments.messages;

import android.view.LayoutInflater;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$$Lambda$4 implements VoidF1 {
    private final DialogsFragment arg$1;
    private final LayoutInflater arg$2;

    private DialogsFragment$$Lambda$4(DialogsFragment dialogsFragment, LayoutInflater layoutInflater) {
        this.arg$1 = dialogsFragment;
        this.arg$2 = layoutInflater;
    }

    public static VoidF1 lambdaFactory$(DialogsFragment dialogsFragment, LayoutInflater layoutInflater) {
        return new DialogsFragment$$Lambda$4(dialogsFragment, layoutInflater);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$onCreateContentView$3(this.arg$2, (Long) obj);
    }
}
