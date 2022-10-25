package com.vk.music.fragment;

import android.view.View;
import com.vk.music.fragment.FragmentDelegateActiveModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditPlaylistFragment$$Lambda$1 implements FragmentDelegateActiveModel.ViewCreator {
    private final EditPlaylistFragment arg$1;

    private EditPlaylistFragment$$Lambda$1(EditPlaylistFragment editPlaylistFragment) {
        this.arg$1 = editPlaylistFragment;
    }

    public static FragmentDelegateActiveModel.ViewCreator lambdaFactory$(EditPlaylistFragment editPlaylistFragment) {
        return new EditPlaylistFragment$$Lambda$1(editPlaylistFragment);
    }

    @Override // com.vk.music.fragment.FragmentDelegateActiveModel.ViewCreator
    @LambdaForm.Hidden
    public View createView(FragmentDelegateActiveModel fragmentDelegateActiveModel) {
        return this.arg$1.lambda$createDelegate$0(fragmentDelegateActiveModel);
    }
}
