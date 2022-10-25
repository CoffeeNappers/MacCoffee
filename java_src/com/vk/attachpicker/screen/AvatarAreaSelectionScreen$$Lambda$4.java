package com.vk.attachpicker.screen;

import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AvatarAreaSelectionScreen$$Lambda$4 implements Consumer {
    private final AvatarAreaSelectionScreen arg$1;

    private AvatarAreaSelectionScreen$$Lambda$4(AvatarAreaSelectionScreen avatarAreaSelectionScreen) {
        this.arg$1 = avatarAreaSelectionScreen;
    }

    public static Consumer lambdaFactory$(AvatarAreaSelectionScreen avatarAreaSelectionScreen) {
        return new AvatarAreaSelectionScreen$$Lambda$4(avatarAreaSelectionScreen);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$loadImages$3((Throwable) obj);
    }
}
