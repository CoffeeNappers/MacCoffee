package com.vkontakte.android.audio.player;

import android.graphics.Bitmap;
import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MediaSessionHelper$$Lambda$1 implements Consumer {
    private final MediaSessionHelper arg$1;
    private final PlayerTrack arg$2;

    private MediaSessionHelper$$Lambda$1(MediaSessionHelper mediaSessionHelper, PlayerTrack playerTrack) {
        this.arg$1 = mediaSessionHelper;
        this.arg$2 = playerTrack;
    }

    public static Consumer lambdaFactory$(MediaSessionHelper mediaSessionHelper, PlayerTrack playerTrack) {
        return new MediaSessionHelper$$Lambda$1(mediaSessionHelper, playerTrack);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$update$0(this.arg$2, (Bitmap) obj);
    }
}
