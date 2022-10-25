package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistModel;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistModelImpl$$Lambda$3 implements ObservableModel.Notification {
    private final PlaylistModelImpl arg$1;

    private PlaylistModelImpl$$Lambda$3(PlaylistModelImpl playlistModelImpl) {
        this.arg$1 = playlistModelImpl;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistModelImpl playlistModelImpl) {
        return new PlaylistModelImpl$$Lambda$3(playlistModelImpl);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$null$0((PlaylistModel.Callback) obj);
    }
}
