package com.vk.music.fragment;

import android.view.View;
import com.vk.music.fragment.FragmentDelegateActiveModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicFragment$$Lambda$1 implements FragmentDelegateActiveModel.ViewCreator {
    private final MusicFragment arg$1;

    private MusicFragment$$Lambda$1(MusicFragment musicFragment) {
        this.arg$1 = musicFragment;
    }

    public static FragmentDelegateActiveModel.ViewCreator lambdaFactory$(MusicFragment musicFragment) {
        return new MusicFragment$$Lambda$1(musicFragment);
    }

    @Override // com.vk.music.fragment.FragmentDelegateActiveModel.ViewCreator
    @LambdaForm.Hidden
    public View createView(FragmentDelegateActiveModel fragmentDelegateActiveModel) {
        return this.arg$1.lambda$createDelegate$0(fragmentDelegateActiveModel);
    }
}
