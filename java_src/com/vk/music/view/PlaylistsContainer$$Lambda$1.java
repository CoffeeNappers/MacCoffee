package com.vk.music.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistsContainer$$Lambda$1 implements View.OnClickListener {
    private final PlaylistsContainer arg$1;

    private PlaylistsContainer$$Lambda$1(PlaylistsContainer playlistsContainer) {
        this.arg$1 = playlistsContainer;
    }

    public static View.OnClickListener lambdaFactory$(PlaylistsContainer playlistsContainer) {
        return new PlaylistsContainer$$Lambda$1(playlistsContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
