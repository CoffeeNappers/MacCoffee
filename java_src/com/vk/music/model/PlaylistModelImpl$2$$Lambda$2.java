package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistModel;
import com.vk.music.model.PlaylistModelImpl;
import com.vkontakte.android.api.audio.AudioGetPlaylist;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistModelImpl$2$$Lambda$2 implements ObservableModel.Notification {
    private final PlaylistModelImpl.AnonymousClass2 arg$1;
    private final AudioGetPlaylist.Result arg$2;

    private PlaylistModelImpl$2$$Lambda$2(PlaylistModelImpl.AnonymousClass2 anonymousClass2, AudioGetPlaylist.Result result) {
        this.arg$1 = anonymousClass2;
        this.arg$2 = result;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistModelImpl.AnonymousClass2 anonymousClass2, AudioGetPlaylist.Result result) {
        return new PlaylistModelImpl$2$$Lambda$2(anonymousClass2, result);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$1(this.arg$2, (PlaylistModel.Callback) obj);
    }
}
