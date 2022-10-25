package com.vkontakte.android.audio.player;

import com.vkontakte.android.audio.player.PlayerService;
import java.lang.invoke.LambdaForm;
import java.util.concurrent.CountDownLatch;
/* loaded from: classes.dex */
final /* synthetic */ class PlayerService$$Lambda$1 implements PlayerService.NetworkStateEventHandler {
    private final CountDownLatch arg$1;

    private PlayerService$$Lambda$1(CountDownLatch countDownLatch) {
        this.arg$1 = countDownLatch;
    }

    public static PlayerService.NetworkStateEventHandler lambdaFactory$(CountDownLatch countDownLatch) {
        return new PlayerService$$Lambda$1(countDownLatch);
    }

    @Override // com.vkontakte.android.audio.player.PlayerService.NetworkStateEventHandler
    @LambdaForm.Hidden
    public void onNetworkStateChanged(PlayerService playerService, boolean z) {
        PlayerService.lambda$waitForOnline$0(this.arg$1, playerService, z);
    }
}
