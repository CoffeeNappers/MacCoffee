package com.vk.music.attach.controller;

import android.view.View;
import com.vk.music.dto.Playlist;
import com.vk.music.view.adapter.ItemViewHolder;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsSearchController$$Lambda$2 implements ItemViewHolder.ClickListener {
    private final PlaylistsSearchController arg$1;

    private PlaylistsSearchController$$Lambda$2(PlaylistsSearchController playlistsSearchController) {
        this.arg$1 = playlistsSearchController;
    }

    public static ItemViewHolder.ClickListener lambdaFactory$(PlaylistsSearchController playlistsSearchController) {
        return new PlaylistsSearchController$$Lambda$2(playlistsSearchController);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        this.arg$1.lambda$onViewAttached$1(view, (Playlist) obj, i);
    }
}
