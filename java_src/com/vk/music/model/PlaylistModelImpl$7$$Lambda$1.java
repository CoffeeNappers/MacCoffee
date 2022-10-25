package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistModel;
import com.vk.music.model.PlaylistModelImpl;
import java.lang.invoke.LambdaForm;
import java.util.List;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistModelImpl$7$$Lambda$1 implements ObservableModel.Notification {
    private final PlaylistModelImpl.AnonymousClass7 arg$1;
    private final List arg$2;

    private PlaylistModelImpl$7$$Lambda$1(PlaylistModelImpl.AnonymousClass7 anonymousClass7, List list) {
        this.arg$1 = anonymousClass7;
        this.arg$2 = list;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistModelImpl.AnonymousClass7 anonymousClass7, List list) {
        return new PlaylistModelImpl$7$$Lambda$1(anonymousClass7, list);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0(this.arg$2, (PlaylistModel.Callback) obj);
    }
}
