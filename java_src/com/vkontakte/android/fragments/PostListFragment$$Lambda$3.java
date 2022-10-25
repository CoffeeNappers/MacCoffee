package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PostListFragment$$Lambda$3 implements View.OnClickListener {
    private final PostListFragment arg$1;

    private PostListFragment$$Lambda$3(PostListFragment postListFragment) {
        this.arg$1 = postListFragment;
    }

    public static View.OnClickListener lambdaFactory$(PostListFragment postListFragment) {
        return new PostListFragment$$Lambda$3(postListFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onViewCreated$1(view);
    }
}
