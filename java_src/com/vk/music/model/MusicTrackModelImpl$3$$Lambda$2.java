package com.vk.music.model;

import com.vk.music.model.MusicTrackModel;
import com.vk.music.model.MusicTrackModelImpl;
import com.vk.music.model.ObservableModel;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicTrackModelImpl$3$$Lambda$2 implements ObservableModel.Notification {
    private final MusicTrackModelImpl.AnonymousClass3 arg$1;
    private final VKAPIRequest.VKErrorResponse arg$2;

    private MusicTrackModelImpl$3$$Lambda$2(MusicTrackModelImpl.AnonymousClass3 anonymousClass3, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = anonymousClass3;
        this.arg$2 = vKErrorResponse;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicTrackModelImpl.AnonymousClass3 anonymousClass3, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new MusicTrackModelImpl$3$$Lambda$2(anonymousClass3, vKErrorResponse);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$1(this.arg$2, (MusicTrackModel.Callback) obj);
    }
}
