package com.vkontakte.android.fragments.news;

import com.vkontakte.android.data.Friends;
import com.vkontakte.android.fragments.news.NewPostFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class NewPostFragment$Presenter$$Lambda$2 implements Friends.GetUsersCallback {
    private final NewPostFragment.Presenter arg$1;

    private NewPostFragment$Presenter$$Lambda$2(NewPostFragment.Presenter presenter) {
        this.arg$1 = presenter;
    }

    public static Friends.GetUsersCallback lambdaFactory$(NewPostFragment.Presenter presenter) {
        return new NewPostFragment$Presenter$$Lambda$2(presenter);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        this.arg$1.lambda$setupInitialData$2(arrayList);
    }
}
