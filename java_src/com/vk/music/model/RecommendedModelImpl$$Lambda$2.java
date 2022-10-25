package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.RecommendedModel;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RecommendedModelImpl$$Lambda$2 implements ObservableModel.Notification {
    private final RecommendedModelImpl arg$1;
    private final VKAPIRequest.VKErrorResponse arg$2;

    private RecommendedModelImpl$$Lambda$2(RecommendedModelImpl recommendedModelImpl, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = recommendedModelImpl;
        this.arg$2 = vKErrorResponse;
    }

    public static ObservableModel.Notification lambdaFactory$(RecommendedModelImpl recommendedModelImpl, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new RecommendedModelImpl$$Lambda$2(recommendedModelImpl, vKErrorResponse);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$1(this.arg$2, (RecommendedModel.Callback) obj);
    }
}
