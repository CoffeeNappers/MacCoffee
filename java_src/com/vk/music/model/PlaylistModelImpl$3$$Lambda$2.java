package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistModel;
import com.vk.music.model.PlaylistModelImpl;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistModelImpl$3$$Lambda$2 implements ObservableModel.Notification {
    private final PlaylistModelImpl.AnonymousClass3 arg$1;
    private final VKAPIRequest.VKErrorResponse arg$2;

    private PlaylistModelImpl$3$$Lambda$2(PlaylistModelImpl.AnonymousClass3 anonymousClass3, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = anonymousClass3;
        this.arg$2 = vKErrorResponse;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistModelImpl.AnonymousClass3 anonymousClass3, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new PlaylistModelImpl$3$$Lambda$2(anonymousClass3, vKErrorResponse);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$1(this.arg$2, (PlaylistModel.Callback) obj);
    }
}
