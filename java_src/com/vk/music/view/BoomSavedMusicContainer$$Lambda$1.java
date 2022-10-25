package com.vk.music.view;

import com.vkontakte.android.audio.AudioFacade;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoomSavedMusicContainer$$Lambda$1 implements AudioFacade.OnConnectionListener {
    private static final BoomSavedMusicContainer$$Lambda$1 instance = new BoomSavedMusicContainer$$Lambda$1();

    private BoomSavedMusicContainer$$Lambda$1() {
    }

    @Override // com.vkontakte.android.audio.AudioFacade.OnConnectionListener
    @LambdaForm.Hidden
    public void onConnected() {
        BoomSavedMusicContainer.lambda$new$0();
    }
}
