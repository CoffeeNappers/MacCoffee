package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistsModel;
import com.vk.music.model.PlaylistsModelImpl;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsModelImpl$2$$Lambda$2 implements ObservableModel.Notification {
    private final PlaylistsModelImpl.AnonymousClass2 arg$1;
    private final VKAPIRequest.VKErrorResponse arg$2;

    private PlaylistsModelImpl$2$$Lambda$2(PlaylistsModelImpl.AnonymousClass2 anonymousClass2, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = anonymousClass2;
        this.arg$2 = vKErrorResponse;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistsModelImpl.AnonymousClass2 anonymousClass2, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new PlaylistsModelImpl$2$$Lambda$2(anonymousClass2, vKErrorResponse);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$1(this.arg$2, (PlaylistsModel.Callback) obj);
    }
}
