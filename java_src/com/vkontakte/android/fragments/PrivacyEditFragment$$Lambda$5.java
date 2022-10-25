package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PrivacyEditFragment$$Lambda$5 implements DialogInterface.OnMultiChoiceClickListener {
    private final boolean[] arg$1;

    private PrivacyEditFragment$$Lambda$5(boolean[] zArr) {
        this.arg$1 = zArr;
    }

    public static DialogInterface.OnMultiChoiceClickListener lambdaFactory$(boolean[] zArr) {
        return new PrivacyEditFragment$$Lambda$5(zArr);
    }

    @Override // android.content.DialogInterface.OnMultiChoiceClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i, boolean z) {
        PrivacyEditFragment.lambda$showListOfCategories$4(this.arg$1, dialogInterface, i, z);
    }
}
