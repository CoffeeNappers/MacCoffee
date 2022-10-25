package com.vk.music.model;

import com.vk.music.event.PlaylistChanged;
import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistsModel;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistsModelImpl$$Lambda$6 implements ObservableModel.Notification {
    private final PlaylistsModelImpl arg$1;
    private final PlaylistChanged arg$2;

    private PlaylistsModelImpl$$Lambda$6(PlaylistsModelImpl playlistsModelImpl, PlaylistChanged playlistChanged) {
        this.arg$1 = playlistsModelImpl;
        this.arg$2 = playlistChanged;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistsModelImpl playlistsModelImpl, PlaylistChanged playlistChanged) {
        return new PlaylistsModelImpl$$Lambda$6(playlistsModelImpl, playlistChanged);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$null$0(this.arg$2, (PlaylistsModel.Callback) obj);
    }
}
