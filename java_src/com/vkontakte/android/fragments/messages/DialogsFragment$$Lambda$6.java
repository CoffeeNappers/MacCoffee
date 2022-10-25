package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.ui.SearchViewWrapper;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DialogsFragment$$Lambda$6 implements SearchViewWrapper.ViewStateListener {
    private final DialogsFragment arg$1;

    private DialogsFragment$$Lambda$6(DialogsFragment dialogsFragment) {
        this.arg$1 = dialogsFragment;
    }

    public static SearchViewWrapper.ViewStateListener lambdaFactory$(DialogsFragment dialogsFragment) {
        return new DialogsFragment$$Lambda$6(dialogsFragment);
    }

    @Override // com.vkontakte.android.ui.SearchViewWrapper.ViewStateListener
    @LambdaForm.Hidden
    public void onViewExpansionStateChanged(boolean z) {
        this.arg$1.lambda$onCreateContentView$5(z);
    }
}
