package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$16 implements Runnable {
    private final ProfileFragment arg$1;

    private ProfileFragment$$Lambda$16(ProfileFragment profileFragment) {
        this.arg$1 = profileFragment;
    }

    public static Runnable lambdaFactory$(ProfileFragment profileFragment) {
        return new ProfileFragment$$Lambda$16(profileFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$buildInfoItems$15();
    }
}