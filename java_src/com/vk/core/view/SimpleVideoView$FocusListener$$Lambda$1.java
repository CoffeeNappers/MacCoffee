package com.vk.core.view;

import com.vk.core.view.SimpleVideoView;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SimpleVideoView$FocusListener$$Lambda$1 implements Runnable {
    private final SimpleVideoView.FocusListener arg$1;

    private SimpleVideoView$FocusListener$$Lambda$1(SimpleVideoView.FocusListener focusListener) {
        this.arg$1 = focusListener;
    }

    public static Runnable lambdaFactory$(SimpleVideoView.FocusListener focusListener) {
        return new SimpleVideoView$FocusListener$$Lambda$1(focusListener);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onAudioFocusChange$0();
    }
}
