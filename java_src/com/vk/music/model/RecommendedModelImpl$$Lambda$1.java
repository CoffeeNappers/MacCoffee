package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.RecommendedModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RecommendedModelImpl$$Lambda$1 implements ObservableModel.Notification {
    private final RecommendedModelImpl arg$1;

    private RecommendedModelImpl$$Lambda$1(RecommendedModelImpl recommendedModelImpl) {
        this.arg$1 = recommendedModelImpl;
    }

    public static ObservableModel.Notification lambdaFactory$(RecommendedModelImpl recommendedModelImpl) {
        return new RecommendedModelImpl$$Lambda$1(recommendedModelImpl);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0((RecommendedModel.Callback) obj);
    }
}
