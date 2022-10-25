package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistModel;
import com.vk.music.model.PlaylistModelImpl;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistModelImpl$1$$Lambda$2 implements ObservableModel.Notification {
    private final PlaylistModelImpl.AnonymousClass1 arg$1;

    private PlaylistModelImpl$1$$Lambda$2(PlaylistModelImpl.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistModelImpl.AnonymousClass1 anonymousClass1) {
        return new PlaylistModelImpl$1$$Lambda$2(anonymousClass1);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$onPostExecute$1((PlaylistModel.Callback) obj);
    }
}
