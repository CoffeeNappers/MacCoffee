package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$10 implements DialogInterface.OnClickListener {
    private final ProfileFragment arg$1;

    private ProfileFragment$$Lambda$10(ProfileFragment profileFragment) {
        this.arg$1 = profileFragment;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ProfileFragment profileFragment) {
        return new ProfileFragment$$Lambda$10(profileFragment);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onActivityResult$9(dialogInterface, i);
    }
}
