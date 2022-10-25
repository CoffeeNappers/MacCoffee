package com.vkontakte.android.fragments.news;

import android.content.DialogInterface;
import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewPostFragment$Presenter$$Lambda$14 implements DialogInterface.OnClickListener {
    private final NewPostFragment.Presenter arg$1;
    private final boolean[] arg$2;

    private NewPostFragment$Presenter$$Lambda$14(NewPostFragment.Presenter presenter, boolean[] zArr) {
        this.arg$1 = presenter;
        this.arg$2 = zArr;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(NewPostFragment.Presenter presenter, boolean[] zArr) {
        return new NewPostFragment$Presenter$$Lambda$14(presenter, zArr);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showOptions$14(this.arg$2, dialogInterface, i);
    }
}
