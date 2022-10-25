package com.vk.attachpicker.screen;

import android.graphics.Bitmap;
import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AvatarAreaSelectionScreen$$Lambda$3 implements Consumer {
    private final AvatarAreaSelectionScreen arg$1;

    private AvatarAreaSelectionScreen$$Lambda$3(AvatarAreaSelectionScreen avatarAreaSelectionScreen) {
        this.arg$1 = avatarAreaSelectionScreen;
    }

    public static Consumer lambdaFactory$(AvatarAreaSelectionScreen avatarAreaSelectionScreen) {
        return new AvatarAreaSelectionScreen$$Lambda$3(avatarAreaSelectionScreen);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$loadImages$2((Bitmap) obj);
    }
}
