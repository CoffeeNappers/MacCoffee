package com.vkontakte.android;

import com.vkontakte.android.fragments.messages.DialogsFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ForwardMessageActivity$$Lambda$1 implements DialogsFragment.SelectionListener {
    private final ForwardMessageActivity arg$1;

    private ForwardMessageActivity$$Lambda$1(ForwardMessageActivity forwardMessageActivity) {
        this.arg$1 = forwardMessageActivity;
    }

    public static DialogsFragment.SelectionListener lambdaFactory$(ForwardMessageActivity forwardMessageActivity) {
        return new ForwardMessageActivity$$Lambda$1(forwardMessageActivity);
    }

    @Override // com.vkontakte.android.fragments.messages.DialogsFragment.SelectionListener
    @LambdaForm.Hidden
    public void onItemSelected(DialogEntry dialogEntry) {
        this.arg$1.lambda$onCreate$0(dialogEntry);
    }
}
