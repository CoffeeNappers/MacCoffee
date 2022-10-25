package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileEditFragment$$Lambda$1 implements View.OnClickListener {
    private final ProfileEditFragment arg$1;

    private ProfileEditFragment$$Lambda$1(ProfileEditFragment profileEditFragment) {
        this.arg$1 = profileEditFragment;
    }

    public static View.OnClickListener lambdaFactory$(ProfileEditFragment profileEditFragment) {
        return new ProfileEditFragment$$Lambda$1(profileEditFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateContentView$0(view);
    }
}
