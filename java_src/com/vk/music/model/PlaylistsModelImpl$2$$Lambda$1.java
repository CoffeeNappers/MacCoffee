package com.vk.music.model;

import com.vk.music.dto.Playlist;
import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistsModel;
import com.vk.music.model.PlaylistsModelImpl;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsModelImpl$2$$Lambda$1 implements ObservableModel.Notification {
    private final PlaylistsModelImpl.AnonymousClass2 arg$1;
    private final Playlist arg$2;

    private PlaylistsModelImpl$2$$Lambda$1(PlaylistsModelImpl.AnonymousClass2 anonymousClass2, Playlist playlist) {
        this.arg$1 = anonymousClass2;
        this.arg$2 = playlist;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistsModelImpl.AnonymousClass2 anonymousClass2, Playlist playlist) {
        return new PlaylistsModelImpl$2$$Lambda$1(anonymousClass2, playlist);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0(this.arg$2, (PlaylistsModel.Callback) obj);
    }
}
