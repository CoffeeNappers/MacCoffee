package com.vkontakte.android.fragments.news;

import android.content.DialogInterface;
import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NewPostFragment$Presenter$$Lambda$1 implements DialogInterface.OnClickListener {
    private final NewPostFragment.Presenter arg$1;

    private NewPostFragment$Presenter$$Lambda$1(NewPostFragment.Presenter presenter) {
        this.arg$1 = presenter;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(NewPostFragment.Presenter presenter) {
        return new NewPostFragment$Presenter$$Lambda$1(presenter);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onClick$0(dialogInterface, i);
    }
}
