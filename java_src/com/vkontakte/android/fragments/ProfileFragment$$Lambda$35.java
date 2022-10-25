package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import android.widget.EditText;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$35 implements DialogInterface.OnClickListener {
    private final ProfileFragment arg$1;
    private final EditText arg$2;

    private ProfileFragment$$Lambda$35(ProfileFragment profileFragment, EditText editText) {
        this.arg$1 = profileFragment;
        this.arg$2 = editText;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ProfileFragment profileFragment, EditText editText) {
        return new ProfileFragment$$Lambda$35(profileFragment, editText);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showStatusEditDlg$34(this.arg$2, dialogInterface, i);
    }
}
