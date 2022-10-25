package com.vk.music.attach.controller;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsController$$Lambda$6 implements View.OnClickListener {
    private final PlaylistsController arg$1;

    private PlaylistsController$$Lambda$6(PlaylistsController playlistsController) {
        this.arg$1 = playlistsController;
    }

    public static View.OnClickListener lambdaFactory$(PlaylistsController playlistsController) {
        return new PlaylistsController$$Lambda$6(playlistsController);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$null$2(view);
    }
}
