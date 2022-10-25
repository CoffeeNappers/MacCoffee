package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistsModel;
import com.vk.music.model.PlaylistsModelImpl;
import com.vkontakte.android.data.VKList;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsModelImpl$1$$Lambda$2 implements ObservableModel.Notification {
    private final PlaylistsModelImpl.AnonymousClass1 arg$1;
    private final VKList arg$2;

    private PlaylistsModelImpl$1$$Lambda$2(PlaylistsModelImpl.AnonymousClass1 anonymousClass1, VKList vKList) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = vKList;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistsModelImpl.AnonymousClass1 anonymousClass1, VKList vKList) {
        return new PlaylistsModelImpl$1$$Lambda$2(anonymousClass1, vKList);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$1(this.arg$2, (PlaylistsModel.Callback) obj);
    }
}
