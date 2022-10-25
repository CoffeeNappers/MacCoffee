package com.vkontakte.android.audio;

import com.vkontakte.android.audio.AudioFacade;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioFacade$1$$Lambda$1 implements Runnable {
    private final AudioFacade.OnConnectionListener arg$1;

    private AudioFacade$1$$Lambda$1(AudioFacade.OnConnectionListener onConnectionListener) {
        this.arg$1 = onConnectionListener;
    }

    public static Runnable lambdaFactory$(AudioFacade.OnConnectionListener onConnectionListener) {
        return new AudioFacade$1$$Lambda$1(onConnectionListener);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onConnected();
    }
}
