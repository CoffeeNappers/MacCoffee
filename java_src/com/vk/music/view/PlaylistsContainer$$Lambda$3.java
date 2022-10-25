package com.vk.music.view;

import android.view.View;
import com.vk.music.dto.Playlist;
import com.vk.music.view.adapter.ItemViewHolder;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistsContainer$$Lambda$3 implements ItemViewHolder.ClickListener {
    private final PlaylistsContainer arg$1;

    private PlaylistsContainer$$Lambda$3(PlaylistsContainer playlistsContainer) {
        this.arg$1 = playlistsContainer;
    }

    public static ItemViewHolder.ClickListener lambdaFactory$(PlaylistsContainer playlistsContainer) {
        return new PlaylistsContainer$$Lambda$3(playlistsContainer);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        this.arg$1.lambda$new$1(view, (Playlist) obj, i);
    }
}
