package com.vkontakte.android.fragments.news;

import android.content.Intent;
import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewPostFragment$Presenter$$Lambda$4 implements Runnable {
    private final NewPostFragment.Presenter arg$1;
    private final int arg$2;
    private final Intent arg$3;

    private NewPostFragment$Presenter$$Lambda$4(NewPostFragment.Presenter presenter, int i, Intent intent) {
        this.arg$1 = presenter;
        this.arg$2 = i;
        this.arg$3 = intent;
    }

    public static Runnable lambdaFactory$(NewPostFragment.Presenter presenter, int i, Intent intent) {
        return new NewPostFragment$Presenter$$Lambda$4(presenter, i, intent);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onActivityResult$4(this.arg$2, this.arg$3);
    }
}
