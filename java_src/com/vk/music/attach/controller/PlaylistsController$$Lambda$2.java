package com.vk.music.attach.controller;

import android.view.View;
import com.vk.music.dto.Playlist;
import com.vk.music.view.adapter.ItemViewHolder;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsController$$Lambda$2 implements ItemViewHolder.ClickListener {
    private final PlaylistsController arg$1;

    private PlaylistsController$$Lambda$2(PlaylistsController playlistsController) {
        this.arg$1 = playlistsController;
    }

    public static ItemViewHolder.ClickListener lambdaFactory$(PlaylistsController playlistsController) {
        return new PlaylistsController$$Lambda$2(playlistsController);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        this.arg$1.lambda$onViewAttached$1(view, (Playlist) obj, i);
    }
}
