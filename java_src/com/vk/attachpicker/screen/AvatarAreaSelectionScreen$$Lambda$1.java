package com.vk.attachpicker.screen;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AvatarAreaSelectionScreen$$Lambda$1 implements View.OnClickListener {
    private final AvatarAreaSelectionScreen arg$1;

    private AvatarAreaSelectionScreen$$Lambda$1(AvatarAreaSelectionScreen avatarAreaSelectionScreen) {
        this.arg$1 = avatarAreaSelectionScreen;
    }

    public static View.OnClickListener lambdaFactory$(AvatarAreaSelectionScreen avatarAreaSelectionScreen) {
        return new AvatarAreaSelectionScreen$$Lambda$1(avatarAreaSelectionScreen);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$createView$0(view);
    }
}
