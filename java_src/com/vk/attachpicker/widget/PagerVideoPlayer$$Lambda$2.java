package com.vk.attachpicker.widget;

import com.vk.attachpicker.events.NotificationListener;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PagerVideoPlayer$$Lambda$2 implements NotificationListener {
    private final PagerVideoPlayer arg$1;

    private PagerVideoPlayer$$Lambda$2(PagerVideoPlayer pagerVideoPlayer) {
        this.arg$1 = pagerVideoPlayer;
    }

    public static NotificationListener lambdaFactory$(PagerVideoPlayer pagerVideoPlayer) {
        return new PagerVideoPlayer$$Lambda$2(pagerVideoPlayer);
    }

    @Override // com.vk.attachpicker.events.NotificationListener
    @LambdaForm.Hidden
    public void onNotification(int i, int i2, Object obj) {
        this.arg$1.lambda$new$5(i, i2, obj);
    }
}
