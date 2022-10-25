package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$8 implements View.OnClickListener {
    private final ProfileFragment arg$1;

    private ProfileFragment$$Lambda$8(ProfileFragment profileFragment) {
        this.arg$1 = profileFragment;
    }

    public static View.OnClickListener lambdaFactory$(ProfileFragment profileFragment) {
        return new ProfileFragment$$Lambda$8(profileFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateView$7(view);
    }
}
