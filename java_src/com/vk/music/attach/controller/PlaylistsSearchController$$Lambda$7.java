package com.vk.music.attach.controller;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsSearchController$$Lambda$7 implements View.OnClickListener {
    private final PlaylistsSearchController arg$1;

    private PlaylistsSearchController$$Lambda$7(PlaylistsSearchController playlistsSearchController) {
        this.arg$1 = playlistsSearchController;
    }

    public static View.OnClickListener lambdaFactory$(PlaylistsSearchController playlistsSearchController) {
        return new PlaylistsSearchController$$Lambda$7(playlistsSearchController);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$null$3(view);
    }
}
