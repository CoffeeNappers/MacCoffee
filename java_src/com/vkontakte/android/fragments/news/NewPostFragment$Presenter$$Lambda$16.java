package com.vkontakte.android.fragments.news;

import android.content.DialogInterface;
import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewPostFragment$Presenter$$Lambda$16 implements DialogInterface.OnDismissListener {
    private final NewPostFragment.Presenter arg$1;

    private NewPostFragment$Presenter$$Lambda$16(NewPostFragment.Presenter presenter) {
        this.arg$1 = presenter;
    }

    public static DialogInterface.OnDismissListener lambdaFactory$(NewPostFragment.Presenter presenter) {
        return new NewPostFragment$Presenter$$Lambda$16(presenter);
    }

    @Override // android.content.DialogInterface.OnDismissListener
    @LambdaForm.Hidden
    public void onDismiss(DialogInterface dialogInterface) {
        this.arg$1.lambda$showOptions$16(dialogInterface);
    }
}
