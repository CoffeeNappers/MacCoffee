package com.vk.music.model;

import com.vk.music.event.PlaylistChanged;
import com.vk.music.model.MusicModel;
import com.vk.music.model.ObservableModel;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MusicModelImpl$$Lambda$6 implements ObservableModel.Notification {
    private final MusicModelImpl arg$1;
    private final PlaylistChanged arg$2;

    private MusicModelImpl$$Lambda$6(MusicModelImpl musicModelImpl, PlaylistChanged playlistChanged) {
        this.arg$1 = musicModelImpl;
        this.arg$2 = playlistChanged;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicModelImpl musicModelImpl, PlaylistChanged playlistChanged) {
        return new MusicModelImpl$$Lambda$6(musicModelImpl, playlistChanged);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$null$0(this.arg$2, (MusicModel.Callback) obj);
    }
}
