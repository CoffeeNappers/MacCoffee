package com.vkontakte.android.media;

import com.vkontakte.android.media.VideoPools;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class VideoPools$$Lambda$3 implements Runnable {
    private final VideoPools.PlayerContext arg$1;

    private VideoPools$$Lambda$3(VideoPools.PlayerContext playerContext) {
        this.arg$1 = playerContext;
    }

    public static Runnable lambdaFactory$(VideoPools.PlayerContext playerContext) {
        return new VideoPools$$Lambda$3(playerContext);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        VideoPools.lambda$null$0(this.arg$1);
    }
}
