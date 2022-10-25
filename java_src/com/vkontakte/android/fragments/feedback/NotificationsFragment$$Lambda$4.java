package com.vkontakte.android.fragments.feedback;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NotificationsFragment$$Lambda$4 implements DialogInterface.OnMultiChoiceClickListener {
    private final boolean[] arg$1;

    private NotificationsFragment$$Lambda$4(boolean[] zArr) {
        this.arg$1 = zArr;
    }

    public static DialogInterface.OnMultiChoiceClickListener lambdaFactory$(boolean[] zArr) {
        return new NotificationsFragment$$Lambda$4(zArr);
    }

    @Override // android.content.DialogInterface.OnMultiChoiceClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i, boolean z) {
        NotificationsFragment.lambda$showFilterDialog$3(this.arg$1, dialogInterface, i, z);
    }
}
