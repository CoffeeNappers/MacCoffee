package com.vkontakte.android.fragments;

import android.graphics.Rect;
import android.view.View;
import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.UsableRecyclerView;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PostListFragment$$Lambda$4 implements UsableRecyclerView.SelectorBoundsProvider {
    private final PostListFragment arg$1;

    private PostListFragment$$Lambda$4(PostListFragment postListFragment) {
        this.arg$1 = postListFragment;
    }

    public static UsableRecyclerView.SelectorBoundsProvider lambdaFactory$(PostListFragment postListFragment) {
        return new PostListFragment$$Lambda$4(postListFragment);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.SelectorBoundsProvider
    @LambdaForm.Hidden
    public void getSelectorBounds(View view, Rect rect) {
        this.arg$1.lambda$onViewCreated$2(view, rect);
    }
}
