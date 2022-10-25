package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistModelImpl$$Lambda$2 implements ObservableModel.Notification {
    private final PlaylistModelImpl arg$1;

    private PlaylistModelImpl$$Lambda$2(PlaylistModelImpl playlistModelImpl) {
        this.arg$1 = playlistModelImpl;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistModelImpl playlistModelImpl) {
        return new PlaylistModelImpl$$Lambda$2(playlistModelImpl);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$delete$2((PlaylistModel.Callback) obj);
    }
}
