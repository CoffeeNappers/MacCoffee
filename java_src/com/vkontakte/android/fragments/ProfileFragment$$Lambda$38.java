package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$38 implements DialogInterface.OnClickListener {
    private final ProfileFragment arg$1;

    private ProfileFragment$$Lambda$38(ProfileFragment profileFragment) {
        this.arg$1 = profileFragment;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ProfileFragment profileFragment) {
        return new ProfileFragment$$Lambda$38(profileFragment);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$removeFriend$37(dialogInterface, i);
    }
}
