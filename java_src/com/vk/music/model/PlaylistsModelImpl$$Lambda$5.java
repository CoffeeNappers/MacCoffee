package com.vk.music.model;

import com.vk.music.event.PlaylistCreated;
import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistsModel;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistsModelImpl$$Lambda$5 implements ObservableModel.Notification {
    private final PlaylistsModelImpl arg$1;
    private final PlaylistCreated arg$2;

    private PlaylistsModelImpl$$Lambda$5(PlaylistsModelImpl playlistsModelImpl, PlaylistCreated playlistCreated) {
        this.arg$1 = playlistsModelImpl;
        this.arg$2 = playlistCreated;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistsModelImpl playlistsModelImpl, PlaylistCreated playlistCreated) {
        return new PlaylistsModelImpl$$Lambda$5(playlistsModelImpl, playlistCreated);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$null$2(this.arg$2, (PlaylistsModel.Callback) obj);
    }
}
