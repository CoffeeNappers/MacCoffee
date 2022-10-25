package com.vkontakte.android.fragments.videos;

import android.view.View;
import com.vkontakte.android.ui.SearchViewWrapper;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class VideosFragment$$Lambda$1 implements SearchViewWrapper.ViewStateListener {
    private final View arg$1;
    private final View arg$2;
    private final SearchVideoListFragment arg$3;

    private VideosFragment$$Lambda$1(View view, View view2, SearchVideoListFragment searchVideoListFragment) {
        this.arg$1 = view;
        this.arg$2 = view2;
        this.arg$3 = searchVideoListFragment;
    }

    public static SearchViewWrapper.ViewStateListener lambdaFactory$(View view, View view2, SearchVideoListFragment searchVideoListFragment) {
        return new VideosFragment$$Lambda$1(view, view2, searchVideoListFragment);
    }

    @Override // com.vkontakte.android.ui.SearchViewWrapper.ViewStateListener
    @LambdaForm.Hidden
    public void onViewExpansionStateChanged(boolean z) {
        VideosFragment.lambda$onViewCreated$0(this.arg$1, this.arg$2, this.arg$3, z);
    }
}
