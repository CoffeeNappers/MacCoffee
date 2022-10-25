package com.vk.music.model;

import com.vk.music.model.MusicModel;
import com.vk.music.model.MusicModelImpl;
import com.vk.music.model.ObservableModel;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicModelImpl$1$$Lambda$3 implements ObservableModel.Notification {
    private final MusicModelImpl.AnonymousClass1 arg$1;
    private final VKAPIRequest.VKErrorResponse arg$2;

    private MusicModelImpl$1$$Lambda$3(MusicModelImpl.AnonymousClass1 anonymousClass1, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = vKErrorResponse;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicModelImpl.AnonymousClass1 anonymousClass1, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new MusicModelImpl$1$$Lambda$3(anonymousClass1, vKErrorResponse);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$2(this.arg$2, (MusicModel.Callback) obj);
    }
}
