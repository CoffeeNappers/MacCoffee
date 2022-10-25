package com.vkontakte.android.fragments;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioPlaylistFragment$$Lambda$1 implements View.OnClickListener {
    private final AudioPlaylistFragment arg$1;

    private AudioPlaylistFragment$$Lambda$1(AudioPlaylistFragment audioPlaylistFragment) {
        this.arg$1 = audioPlaylistFragment;
    }

    public static View.OnClickListener lambdaFactory$(AudioPlaylistFragment audioPlaylistFragment) {
        return new AudioPlaylistFragment$$Lambda$1(audioPlaylistFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateView$0(view);
    }
}
