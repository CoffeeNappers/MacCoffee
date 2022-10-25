package com.vkontakte.android.audio.player.ads;

import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.player.ads.AudioAd;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AdPlayerHelper$$Lambda$1 implements AudioAd.OnCompleteListener {
    private final AdPlayerHelper arg$1;
    private final MusicTrack arg$2;
    private final String arg$3;
    private final MediaPlayerHelperI.Refer arg$4;

    private AdPlayerHelper$$Lambda$1(AdPlayerHelper adPlayerHelper, MusicTrack musicTrack, String str, MediaPlayerHelperI.Refer refer) {
        this.arg$1 = adPlayerHelper;
        this.arg$2 = musicTrack;
        this.arg$3 = str;
        this.arg$4 = refer;
    }

    public static AudioAd.OnCompleteListener lambdaFactory$(AdPlayerHelper adPlayerHelper, MusicTrack musicTrack, String str, MediaPlayerHelperI.Refer refer) {
        return new AdPlayerHelper$$Lambda$1(adPlayerHelper, musicTrack, str, refer);
    }

    @Override // com.vkontakte.android.audio.player.ads.AudioAd.OnCompleteListener
    @LambdaForm.Hidden
    public void onComplete() {
        this.arg$1.lambda$play$0(this.arg$2, this.arg$3, this.arg$4);
    }
}
