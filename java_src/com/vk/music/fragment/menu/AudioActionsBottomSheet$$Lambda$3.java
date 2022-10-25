package com.vk.music.fragment.menu;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioActionsBottomSheet$$Lambda$3 implements View.OnClickListener {
    private final AudioActionsBottomSheet arg$1;

    private AudioActionsBottomSheet$$Lambda$3(AudioActionsBottomSheet audioActionsBottomSheet) {
        this.arg$1 = audioActionsBottomSheet;
    }

    public static View.OnClickListener lambdaFactory$(AudioActionsBottomSheet audioActionsBottomSheet) {
        return new AudioActionsBottomSheet$$Lambda$3(audioActionsBottomSheet);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$null$0(view);
    }
}
