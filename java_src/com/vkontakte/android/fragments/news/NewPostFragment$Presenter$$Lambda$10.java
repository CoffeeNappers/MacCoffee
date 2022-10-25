package com.vkontakte.android.fragments.news;

import android.content.DialogInterface;
import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class NewPostFragment$Presenter$$Lambda$10 implements DialogInterface.OnMultiChoiceClickListener {
    private final NewPostFragment.Presenter arg$1;
    private final ArrayList arg$2;
    private final boolean[] arg$3;
    private final boolean[] arg$4;

    private NewPostFragment$Presenter$$Lambda$10(NewPostFragment.Presenter presenter, ArrayList arrayList, boolean[] zArr, boolean[] zArr2) {
        this.arg$1 = presenter;
        this.arg$2 = arrayList;
        this.arg$3 = zArr;
        this.arg$4 = zArr2;
    }

    public static DialogInterface.OnMultiChoiceClickListener lambdaFactory$(NewPostFragment.Presenter presenter, ArrayList arrayList, boolean[] zArr, boolean[] zArr2) {
        return new NewPostFragment$Presenter$$Lambda$10(presenter, arrayList, zArr, zArr2);
    }

    @Override // android.content.DialogInterface.OnMultiChoiceClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i, boolean z) {
        this.arg$1.lambda$showOptions$10(this.arg$2, this.arg$3, this.arg$4, dialogInterface, i, z);
    }
}
