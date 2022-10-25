package com.vk.music.fragment;

import android.view.View;
import com.vk.music.fragment.FragmentDelegateActiveModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchFragment$$Lambda$1 implements FragmentDelegateActiveModel.ViewCreator {
    private final SearchFragment arg$1;

    private SearchFragment$$Lambda$1(SearchFragment searchFragment) {
        this.arg$1 = searchFragment;
    }

    public static FragmentDelegateActiveModel.ViewCreator lambdaFactory$(SearchFragment searchFragment) {
        return new SearchFragment$$Lambda$1(searchFragment);
    }

    @Override // com.vk.music.fragment.FragmentDelegateActiveModel.ViewCreator
    @LambdaForm.Hidden
    public View createView(FragmentDelegateActiveModel fragmentDelegateActiveModel) {
        return this.arg$1.lambda$createDelegate$0(fragmentDelegateActiveModel);
    }
}
