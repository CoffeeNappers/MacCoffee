package com.vk.music.model;

import com.vk.music.dto.Playlist;
import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistsModel;
import com.vk.music.model.PlaylistsModelImpl;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsModelImpl$3$$Lambda$1 implements ObservableModel.Notification {
    private final PlaylistsModelImpl.AnonymousClass3 arg$1;
    private final Playlist arg$2;

    private PlaylistsModelImpl$3$$Lambda$1(PlaylistsModelImpl.AnonymousClass3 anonymousClass3, Playlist playlist) {
        this.arg$1 = anonymousClass3;
        this.arg$2 = playlist;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistsModelImpl.AnonymousClass3 anonymousClass3, Playlist playlist) {
        return new PlaylistsModelImpl$3$$Lambda$1(anonymousClass3, playlist);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0(this.arg$2, (PlaylistsModel.Callback) obj);
    }
}
