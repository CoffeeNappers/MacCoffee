package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.PlayerModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlayerModelImpl$$Lambda$3 implements ObservableModel.Notification {
    private final PlayerModelImpl arg$1;

    private PlayerModelImpl$$Lambda$3(PlayerModelImpl playerModelImpl) {
        this.arg$1 = playerModelImpl;
    }

    public static ObservableModel.Notification lambdaFactory$(PlayerModelImpl playerModelImpl) {
        return new PlayerModelImpl$$Lambda$3(playerModelImpl);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$onStateChanged$2((PlayerModel.Callback) obj);
    }
}
