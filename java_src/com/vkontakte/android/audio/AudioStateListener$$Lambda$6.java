package com.vkontakte.android.audio;

import com.vkontakte.android.audio.player.Player;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AudioStateListener$$Lambda$6 implements Runnable {
    private final AudioStateListener arg$1;
    private final Player arg$2;

    private AudioStateListener$$Lambda$6(AudioStateListener audioStateListener, Player player) {
        this.arg$1 = audioStateListener;
        this.arg$2 = player;
    }

    public static Runnable lambdaFactory$(AudioStateListener audioStateListener, Player player) {
        return new AudioStateListener$$Lambda$6(audioStateListener, player);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$notifyOnParametersChanged$4(this.arg$2);
    }
}
