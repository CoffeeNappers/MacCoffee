package com.vk.music.model;

import com.vk.music.event.PlaylistCreated;
import com.vk.music.model.MusicModel;
import com.vk.music.model.ObservableModel;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MusicModelImpl$$Lambda$5 implements ObservableModel.Notification {
    private final MusicModelImpl arg$1;
    private final PlaylistCreated arg$2;

    private MusicModelImpl$$Lambda$5(MusicModelImpl musicModelImpl, PlaylistCreated playlistCreated) {
        this.arg$1 = musicModelImpl;
        this.arg$2 = playlistCreated;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicModelImpl musicModelImpl, PlaylistCreated playlistCreated) {
        return new MusicModelImpl$$Lambda$5(musicModelImpl, playlistCreated);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$null$2(this.arg$2, (MusicModel.Callback) obj);
    }
}
