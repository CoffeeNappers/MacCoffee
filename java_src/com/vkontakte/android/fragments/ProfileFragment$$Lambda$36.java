package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import android.widget.EditText;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$36 implements DialogInterface.OnShowListener {
    private final ProfileFragment arg$1;
    private final EditText arg$2;

    private ProfileFragment$$Lambda$36(ProfileFragment profileFragment, EditText editText) {
        this.arg$1 = profileFragment;
        this.arg$2 = editText;
    }

    public static DialogInterface.OnShowListener lambdaFactory$(ProfileFragment profileFragment, EditText editText) {
        return new ProfileFragment$$Lambda$36(profileFragment, editText);
    }

    @Override // android.content.DialogInterface.OnShowListener
    @LambdaForm.Hidden
    public void onShow(DialogInterface dialogInterface) {
        this.arg$1.lambda$showStatusEditDlg$35(this.arg$2, dialogInterface);
    }
}
