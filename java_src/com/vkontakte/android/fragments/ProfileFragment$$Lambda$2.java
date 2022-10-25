package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$$Lambda$2 implements DividerItemDecoration.Provider {
    private final ProfileFragment arg$1;

    private ProfileFragment$$Lambda$2(ProfileFragment profileFragment) {
        this.arg$1 = profileFragment;
    }

    public static DividerItemDecoration.Provider lambdaFactory$(ProfileFragment profileFragment) {
        return new ProfileFragment$$Lambda$2(profileFragment);
    }

    @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
    @LambdaForm.Hidden
    public boolean needDrawDividerAfter(int i) {
        return this.arg$1.lambda$onViewCreated$1(i);
    }
}
