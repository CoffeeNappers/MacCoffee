package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.DialogEntry;
import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$$Lambda$1 implements DialogsFragment.SelectionListener {
    private final DialogsFragment arg$1;

    private DialogsFragment$$Lambda$1(DialogsFragment dialogsFragment) {
        this.arg$1 = dialogsFragment;
    }

    public static DialogsFragment.SelectionListener lambdaFactory$(DialogsFragment dialogsFragment) {
        return new DialogsFragment$$Lambda$1(dialogsFragment);
    }

    @Override // com.vkontakte.android.fragments.messages.DialogsFragment.SelectionListener
    @LambdaForm.Hidden
    public void onItemSelected(DialogEntry dialogEntry) {
        this.arg$1.lambda$onCreate$0(dialogEntry);
    }
}
