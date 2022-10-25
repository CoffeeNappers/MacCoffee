package com.vk.music.attach.controller;

import com.vkontakte.android.functions.VoidF;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistMusicController$$Lambda$1 implements VoidF {
    private final PlaylistMusicController arg$1;

    private PlaylistMusicController$$Lambda$1(PlaylistMusicController playlistMusicController) {
        this.arg$1 = playlistMusicController;
    }

    public static VoidF lambdaFactory$(PlaylistMusicController playlistMusicController) {
        return new PlaylistMusicController$$Lambda$1(playlistMusicController);
    }

    @Override // com.vkontakte.android.functions.VoidF
    @LambdaForm.Hidden
    public void f() {
        PlaylistMusicController.access$lambda$0(this.arg$1);
    }
}
