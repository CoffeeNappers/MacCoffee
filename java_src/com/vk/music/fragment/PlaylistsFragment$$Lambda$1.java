package com.vk.music.fragment;

import android.view.View;
import com.vk.music.fragment.FragmentDelegateActiveModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsFragment$$Lambda$1 implements FragmentDelegateActiveModel.ViewCreator {
    private final PlaylistsFragment arg$1;

    private PlaylistsFragment$$Lambda$1(PlaylistsFragment playlistsFragment) {
        this.arg$1 = playlistsFragment;
    }

    public static FragmentDelegateActiveModel.ViewCreator lambdaFactory$(PlaylistsFragment playlistsFragment) {
        return new PlaylistsFragment$$Lambda$1(playlistsFragment);
    }

    @Override // com.vk.music.fragment.FragmentDelegateActiveModel.ViewCreator
    @LambdaForm.Hidden
    public View createView(FragmentDelegateActiveModel fragmentDelegateActiveModel) {
        return this.arg$1.lambda$createDelegate$0(fragmentDelegateActiveModel);
    }
}
