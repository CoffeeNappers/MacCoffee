package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$43 implements DialogInterface.OnClickListener {
    private final ProfileFragment arg$1;

    private ProfileFragment$$Lambda$43(ProfileFragment profileFragment) {
        this.arg$1 = profileFragment;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ProfileFragment profileFragment) {
        return new ProfileFragment$$Lambda$43(profileFragment);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$toggleBlacklist$42(dialogInterface, i);
    }
}
