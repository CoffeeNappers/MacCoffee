package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$4 implements View.OnLongClickListener {
    private final ProfileFragment arg$1;

    private ProfileFragment$$Lambda$4(ProfileFragment profileFragment) {
        this.arg$1 = profileFragment;
    }

    public static View.OnLongClickListener lambdaFactory$(ProfileFragment profileFragment) {
        return new ProfileFragment$$Lambda$4(profileFragment);
    }

    @Override // android.view.View.OnLongClickListener
    @LambdaForm.Hidden
    public boolean onLongClick(View view) {
        return this.arg$1.lambda$applyLayout$3(view);
    }
}
