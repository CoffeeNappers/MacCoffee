package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlaylistsModel;
import com.vk.music.model.PlaylistsModelImpl;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsModelImpl$1$$Lambda$3 implements ObservableModel.Notification {
    private final PlaylistsModelImpl.AnonymousClass1 arg$1;
    private final VKAPIRequest.VKErrorResponse arg$2;

    private PlaylistsModelImpl$1$$Lambda$3(PlaylistsModelImpl.AnonymousClass1 anonymousClass1, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = vKErrorResponse;
    }

    public static ObservableModel.Notification lambdaFactory$(PlaylistsModelImpl.AnonymousClass1 anonymousClass1, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new PlaylistsModelImpl$1$$Lambda$3(anonymousClass1, vKErrorResponse);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$2(this.arg$2, (PlaylistsModel.Callback) obj);
    }
}
