package com.vkontakte.android.fragments;

import com.vkontakte.android.ui.SearchViewWrapper;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioListFragment$$Lambda$1 implements SearchViewWrapper.ViewStateListener {
    private final AudioListFragment arg$1;

    private AudioListFragment$$Lambda$1(AudioListFragment audioListFragment) {
        this.arg$1 = audioListFragment;
    }

    public static SearchViewWrapper.ViewStateListener lambdaFactory$(AudioListFragment audioListFragment) {
        return new AudioListFragment$$Lambda$1(audioListFragment);
    }

    @Override // com.vkontakte.android.ui.SearchViewWrapper.ViewStateListener
    @LambdaForm.Hidden
    public void onViewExpansionStateChanged(boolean z) {
        AudioListFragment.access$lambda$0(this.arg$1, z);
    }
}
