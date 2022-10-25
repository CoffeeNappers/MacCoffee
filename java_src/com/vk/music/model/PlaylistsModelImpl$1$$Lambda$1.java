package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistsModel;
import com.vk.music.model.PlaylistsModelImpl;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsModelImpl$1$$Lambda$1 implements ObservableModel.Notification {
    private final PlaylistsModelImpl.AnonymousClass1 arg$1;

    private PlaylistsModelImpl$1$$Lambda$1(PlaylistsModelImpl.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistsModelImpl.AnonymousClass1 anonymousClass1) {
        return new PlaylistsModelImpl$1$$Lambda$1(anonymousClass1);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0((PlaylistsModel.Callback) obj);
    }
}
