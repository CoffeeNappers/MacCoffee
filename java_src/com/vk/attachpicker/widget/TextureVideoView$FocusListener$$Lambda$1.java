package com.vk.attachpicker.widget;

import com.vk.attachpicker.widget.TextureVideoView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TextureVideoView$FocusListener$$Lambda$1 implements Runnable {
    private final TextureVideoView.FocusListener arg$1;

    private TextureVideoView$FocusListener$$Lambda$1(TextureVideoView.FocusListener focusListener) {
        this.arg$1 = focusListener;
    }

    public static Runnable lambdaFactory$(TextureVideoView.FocusListener focusListener) {
        return new TextureVideoView$FocusListener$$Lambda$1(focusListener);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onAudioFocusChange$0();
    }
}
