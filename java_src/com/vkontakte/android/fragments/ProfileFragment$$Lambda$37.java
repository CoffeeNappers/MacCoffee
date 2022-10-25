package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$37 implements DialogInterface.OnClickListener {
    private final ProfileFragment arg$1;
    private final View arg$2;

    private ProfileFragment$$Lambda$37(ProfileFragment profileFragment, View view) {
        this.arg$1 = profileFragment;
        this.arg$2 = view;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ProfileFragment profileFragment, View view) {
        return new ProfileFragment$$Lambda$37(profileFragment, view);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$addFriend$36(this.arg$2, dialogInterface, i);
    }
}
