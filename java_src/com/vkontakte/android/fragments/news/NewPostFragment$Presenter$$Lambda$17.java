package com.vkontakte.android.fragments.news;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewPostFragment$Presenter$$Lambda$17 implements Runnable {
    private final NewPostFragment.Presenter arg$1;
    private final UserProfile arg$2;

    private NewPostFragment$Presenter$$Lambda$17(NewPostFragment.Presenter presenter, UserProfile userProfile) {
        this.arg$1 = presenter;
        this.arg$2 = userProfile;
    }

    public static Runnable lambdaFactory$(NewPostFragment.Presenter presenter, UserProfile userProfile) {
        return new NewPostFragment$Presenter$$Lambda$17(presenter, userProfile);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$1(this.arg$2);
    }
}
