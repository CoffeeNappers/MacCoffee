package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$39 implements DialogInterface.OnMultiChoiceClickListener {
    private final boolean[] arg$1;

    private ProfileFragment$$Lambda$39(boolean[] zArr) {
        this.arg$1 = zArr;
    }

    public static DialogInterface.OnMultiChoiceClickListener lambdaFactory$(boolean[] zArr) {
        return new ProfileFragment$$Lambda$39(zArr);
    }

    @Override // android.content.DialogInterface.OnMultiChoiceClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i, boolean z) {
        ProfileFragment.lambda$editFriendLists$38(this.arg$1, dialogInterface, i, z);
    }
}
