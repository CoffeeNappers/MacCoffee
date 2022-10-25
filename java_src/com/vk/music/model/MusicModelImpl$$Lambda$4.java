package com.vk.music.model;

import com.vk.music.event.PlaylistRemoved;
import com.vk.music.model.MusicModel;
import com.vk.music.model.ObservableModel;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MusicModelImpl$$Lambda$4 implements ObservableModel.Notification {
    private final MusicModelImpl arg$1;
    private final PlaylistRemoved arg$2;

    private MusicModelImpl$$Lambda$4(MusicModelImpl musicModelImpl, PlaylistRemoved playlistRemoved) {
        this.arg$1 = musicModelImpl;
        this.arg$2 = playlistRemoved;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicModelImpl musicModelImpl, PlaylistRemoved playlistRemoved) {
        return new MusicModelImpl$$Lambda$4(musicModelImpl, playlistRemoved);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$null$4(this.arg$2, (MusicModel.Callback) obj);
    }
}
