package com.vkontakte.android.fragments.news;

import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewPostFragment$Presenter$$Lambda$3 implements Runnable {
    private final NewPostFragment.Presenter arg$1;

    private NewPostFragment$Presenter$$Lambda$3(NewPostFragment.Presenter presenter) {
        this.arg$1 = presenter;
    }

    public static Runnable lambdaFactory$(NewPostFragment.Presenter presenter) {
        return new NewPostFragment$Presenter$$Lambda$3(presenter);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$setupInitialData$3();
    }
}
