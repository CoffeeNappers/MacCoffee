package com.vkontakte.android;

import com.vkontakte.android.AudioMessagePlayerService;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioMessagePlayerService$FocusListener$$Lambda$1 implements Runnable {
    private static final AudioMessagePlayerService$FocusListener$$Lambda$1 instance = new AudioMessagePlayerService$FocusListener$$Lambda$1();

    private AudioMessagePlayerService$FocusListener$$Lambda$1() {
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        AudioMessagePlayerService.FocusListener.lambda$onAudioFocusChange$0();
    }
}
