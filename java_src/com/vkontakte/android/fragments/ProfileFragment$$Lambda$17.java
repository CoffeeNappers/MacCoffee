package com.vkontakte.android.fragments;

import com.vkontakte.android.api.ExtendedUserProfile;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ProfileFragment$$Lambda$17 implements Runnable {
    private final ProfileFragment arg$1;
    private final ExtendedUserProfile.Employer arg$2;

    private ProfileFragment$$Lambda$17(ProfileFragment profileFragment, ExtendedUserProfile.Employer employer) {
        this.arg$1 = profileFragment;
        this.arg$2 = employer;
    }

    public static Runnable lambdaFactory$(ProfileFragment profileFragment, ExtendedUserProfile.Employer employer) {
        return new ProfileFragment$$Lambda$17(profileFragment, employer);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$buildInfoItems$16(this.arg$2);
    }
}
