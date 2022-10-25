package com.vk.music.fragment;

import com.vk.music.fragment.EditPlaylistModelImpl;
import com.vk.music.model.EditPlaylistModel;
import com.vk.music.model.ObservableModel;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditPlaylistModelImpl$1$$Lambda$2 implements ObservableModel.Notification {
    private final EditPlaylistModelImpl.AnonymousClass1 arg$1;
    private final VKAPIRequest.VKErrorResponse arg$2;

    private EditPlaylistModelImpl$1$$Lambda$2(EditPlaylistModelImpl.AnonymousClass1 anonymousClass1, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = vKErrorResponse;
    }

    public static ObservableModel.Notification lambdaFactory$(EditPlaylistModelImpl.AnonymousClass1 anonymousClass1, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new EditPlaylistModelImpl$1$$Lambda$2(anonymousClass1, vKErrorResponse);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$1(this.arg$2, (EditPlaylistModel.Callback) obj);
    }
}
