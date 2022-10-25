package com.vk.music.fragment.menu;

import android.view.View;
import com.vk.music.dto.Playlist;
import com.vk.music.view.adapter.ItemViewHolder;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistActionsBottomSheet$$Lambda$2 implements ItemViewHolder.ClickListener {
    private final PlaylistActionsBottomSheet arg$1;

    private PlaylistActionsBottomSheet$$Lambda$2(PlaylistActionsBottomSheet playlistActionsBottomSheet) {
        this.arg$1 = playlistActionsBottomSheet;
    }

    public static ItemViewHolder.ClickListener lambdaFactory$(PlaylistActionsBottomSheet playlistActionsBottomSheet) {
        return new PlaylistActionsBottomSheet$$Lambda$2(playlistActionsBottomSheet);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        this.arg$1.lambda$onCreateHeaderAdapter$1(view, (Playlist) obj, i);
    }
}
