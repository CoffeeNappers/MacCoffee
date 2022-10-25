package com.vkontakte.android.audio.player.ads;

import com.vkontakte.android.audio.player.ads.AudioAd;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AdPlayerHelper$$Lambda$3 implements AudioAd.OnCompleteListener {
    private final AdPlayerHelper arg$1;

    private AdPlayerHelper$$Lambda$3(AdPlayerHelper adPlayerHelper) {
        this.arg$1 = adPlayerHelper;
    }

    public static AudioAd.OnCompleteListener lambdaFactory$(AdPlayerHelper adPlayerHelper) {
        return new AdPlayerHelper$$Lambda$3(adPlayerHelper);
    }

    @Override // com.vkontakte.android.audio.player.ads.AudioAd.OnCompleteListener
    @LambdaForm.Hidden
    public void onComplete() {
        this.arg$1.lambda$onProgress$2();
    }
}
