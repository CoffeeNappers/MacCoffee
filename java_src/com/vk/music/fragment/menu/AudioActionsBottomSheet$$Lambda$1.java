package com.vk.music.fragment.menu;

import android.view.View;
import com.vk.music.view.adapter.ItemViewHolder;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioActionsBottomSheet$$Lambda$1 implements ItemViewHolder.Builder.Init {
    private final AudioActionsBottomSheet arg$1;

    private AudioActionsBottomSheet$$Lambda$1(AudioActionsBottomSheet audioActionsBottomSheet) {
        this.arg$1 = audioActionsBottomSheet;
    }

    public static ItemViewHolder.Builder.Init lambdaFactory$(AudioActionsBottomSheet audioActionsBottomSheet) {
        return new AudioActionsBottomSheet$$Lambda$1(audioActionsBottomSheet);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.Builder.Init
    @LambdaForm.Hidden
    public void apply(View view) {
        this.arg$1.lambda$onCreateHeaderAdapter$1(view);
    }
}
