package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistsModel;
import com.vk.music.model.PlaylistsModelImpl;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsModelImpl$3$$Lambda$2 implements ObservableModel.Notification {
    private final PlaylistsModelImpl.AnonymousClass3 arg$1;
    private final VKAPIRequest.VKErrorResponse arg$2;

    private PlaylistsModelImpl$3$$Lambda$2(PlaylistsModelImpl.AnonymousClass3 anonymousClass3, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = anonymousClass3;
        this.arg$2 = vKErrorResponse;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistsModelImpl.AnonymousClass3 anonymousClass3, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new PlaylistsModelImpl$3$$Lambda$2(anonymousClass3, vKErrorResponse);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$1(this.arg$2, (PlaylistsModel.Callback) obj);
    }
}
