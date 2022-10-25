package com.vkontakte.android.audio.player.ads;

import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.player.ads.AudioAd;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AdPlayerHelper$$Lambda$2 implements AudioAd.OnCompleteListener {
    private final AdPlayerHelper arg$1;
    private final MediaPlayerHelperI arg$2;

    private AdPlayerHelper$$Lambda$2(AdPlayerHelper adPlayerHelper, MediaPlayerHelperI mediaPlayerHelperI) {
        this.arg$1 = adPlayerHelper;
        this.arg$2 = mediaPlayerHelperI;
    }

    public static AudioAd.OnCompleteListener lambdaFactory$(AdPlayerHelper adPlayerHelper, MediaPlayerHelperI mediaPlayerHelperI) {
        return new AdPlayerHelper$$Lambda$2(adPlayerHelper, mediaPlayerHelperI);
    }

    @Override // com.vkontakte.android.audio.player.ads.AudioAd.OnCompleteListener
    @LambdaForm.Hidden
    public void onComplete() {
        this.arg$1.lambda$onCompleted$1(this.arg$2);
    }
}
