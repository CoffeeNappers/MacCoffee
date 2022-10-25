package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistModel;
import com.vk.music.model.PlaylistModelImpl;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistModelImpl$2$$Lambda$1 implements ObservableModel.Notification {
    private final PlaylistModelImpl.AnonymousClass2 arg$1;

    private PlaylistModelImpl$2$$Lambda$1(PlaylistModelImpl.AnonymousClass2 anonymousClass2) {
        this.arg$1 = anonymousClass2;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistModelImpl.AnonymousClass2 anonymousClass2) {
        return new PlaylistModelImpl$2$$Lambda$1(anonymousClass2);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0((PlaylistModel.Callback) obj);
    }
}
