package com.vkontakte.android.fragments.news;

import android.content.DialogInterface;
import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewPostFragment$Presenter$$Lambda$13 implements DialogInterface.OnMultiChoiceClickListener {
    private final NewPostFragment.Presenter arg$1;
    private final boolean[] arg$2;
    private final boolean[] arg$3;

    private NewPostFragment$Presenter$$Lambda$13(NewPostFragment.Presenter presenter, boolean[] zArr, boolean[] zArr2) {
        this.arg$1 = presenter;
        this.arg$2 = zArr;
        this.arg$3 = zArr2;
    }

    public static DialogInterface.OnMultiChoiceClickListener lambdaFactory$(NewPostFragment.Presenter presenter, boolean[] zArr, boolean[] zArr2) {
        return new NewPostFragment$Presenter$$Lambda$13(presenter, zArr, zArr2);
    }

    @Override // android.content.DialogInterface.OnMultiChoiceClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i, boolean z) {
        this.arg$1.lambda$showOptions$13(this.arg$2, this.arg$3, dialogInterface, i, z);
    }
}
