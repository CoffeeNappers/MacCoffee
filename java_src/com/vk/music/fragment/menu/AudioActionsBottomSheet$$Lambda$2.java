package com.vk.music.fragment.menu;

import com.vk.music.view.adapter.IdResolver;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AudioActionsBottomSheet$$Lambda$2 implements IdResolver {
    private static final AudioActionsBottomSheet$$Lambda$2 instance = new AudioActionsBottomSheet$$Lambda$2();

    private AudioActionsBottomSheet$$Lambda$2() {
    }

    @Override // com.vk.music.view.adapter.IdResolver
    @LambdaForm.Hidden
    public long resolve(Object obj) {
        return ((MusicTrack) obj).getMidId();
    }
}
