package com.vk.music.view;

import android.support.v4.widget.SwipeRefreshLayout;
import com.vk.music.model.PlaylistsModel;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistsContainer$$Lambda$2 implements SwipeRefreshLayout.OnRefreshListener {
    private final PlaylistsModel arg$1;

    private PlaylistsContainer$$Lambda$2(PlaylistsModel playlistsModel) {
        this.arg$1 = playlistsModel;
    }

    public static SwipeRefreshLayout.OnRefreshListener lambdaFactory$(PlaylistsModel playlistsModel) {
        return new PlaylistsContainer$$Lambda$2(playlistsModel);
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    @LambdaForm.Hidden
    public void onRefresh() {
        this.arg$1.loadPlaylists();
    }
}
