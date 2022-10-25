package com.vk.music.view;

import android.view.View;
import com.vk.music.view.adapter.ItemViewHolder;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistContainer$$Lambda$4 implements ItemViewHolder.ClickListener {
    private final PlaylistContainer arg$1;

    private PlaylistContainer$$Lambda$4(PlaylistContainer playlistContainer) {
        this.arg$1 = playlistContainer;
    }

    public static ItemViewHolder.ClickListener lambdaFactory$(PlaylistContainer playlistContainer) {
        return new PlaylistContainer$$Lambda$4(playlistContainer);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        this.arg$1.lambda$bind$4(view, (MusicTrack) obj, i);
    }
}
