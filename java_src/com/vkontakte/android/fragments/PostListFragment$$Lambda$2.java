package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PostListFragment$$Lambda$2 implements View.OnClickListener {
    private final PostListFragment arg$1;

    private PostListFragment$$Lambda$2(PostListFragment postListFragment) {
        this.arg$1 = postListFragment;
    }

    public static View.OnClickListener lambdaFactory$(PostListFragment postListFragment) {
        return new PostListFragment$$Lambda$2(postListFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
