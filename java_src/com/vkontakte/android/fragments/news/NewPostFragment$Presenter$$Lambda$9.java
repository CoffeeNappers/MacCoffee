package com.vkontakte.android.fragments.news;

import android.content.DialogInterface;
import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewPostFragment$Presenter$$Lambda$9 implements DialogInterface.OnClickListener {
    private final NewPostFragment.Presenter arg$1;

    private NewPostFragment$Presenter$$Lambda$9(NewPostFragment.Presenter presenter) {
        this.arg$1 = presenter;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(NewPostFragment.Presenter presenter) {
        return new NewPostFragment$Presenter$$Lambda$9(presenter);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$startLocationChooser$9(dialogInterface, i);
    }
}
