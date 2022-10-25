package com.vk.music.fragment;

import android.view.View;
import com.vk.music.fragment.FragmentDelegateActiveModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistFragment$$Lambda$1 implements FragmentDelegateActiveModel.ViewCreator {
    private final PlaylistFragment arg$1;

    private PlaylistFragment$$Lambda$1(PlaylistFragment playlistFragment) {
        this.arg$1 = playlistFragment;
    }

    public static FragmentDelegateActiveModel.ViewCreator lambdaFactory$(PlaylistFragment playlistFragment) {
        return new PlaylistFragment$$Lambda$1(playlistFragment);
    }

    @Override // com.vk.music.fragment.FragmentDelegateActiveModel.ViewCreator
    @LambdaForm.Hidden
    public View createView(FragmentDelegateActiveModel fragmentDelegateActiveModel) {
        return this.arg$1.lambda$createDelegate$0(fragmentDelegateActiveModel);
    }
}
