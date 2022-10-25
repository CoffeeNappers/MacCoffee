package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$13 implements Runnable {
    private final ProfileFragment arg$1;

    private ProfileFragment$$Lambda$13(ProfileFragment profileFragment) {
        this.arg$1 = profileFragment;
    }

    public static Runnable lambdaFactory$(ProfileFragment profileFragment) {
        return new ProfileFragment$$Lambda$13(profileFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        ProfileFragment.access$lambda$0(this.arg$1);
    }
}
