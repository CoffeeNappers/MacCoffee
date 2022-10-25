package com.vk.music.model;

import com.vk.music.event.PlaylistRemoved;
import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistsModel;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistsModelImpl$$Lambda$4 implements ObservableModel.Notification {
    private final PlaylistsModelImpl arg$1;
    private final PlaylistRemoved arg$2;

    private PlaylistsModelImpl$$Lambda$4(PlaylistsModelImpl playlistsModelImpl, PlaylistRemoved playlistRemoved) {
        this.arg$1 = playlistsModelImpl;
        this.arg$2 = playlistRemoved;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistsModelImpl playlistsModelImpl, PlaylistRemoved playlistRemoved) {
        return new PlaylistsModelImpl$$Lambda$4(playlistsModelImpl, playlistRemoved);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$null$4(this.arg$2, (PlaylistsModel.Callback) obj);
    }
}
