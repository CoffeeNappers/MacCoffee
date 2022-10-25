package com.vk.music.model;

import com.vk.music.event.Event;
import com.vk.music.event.PlaylistChanged;
import com.vk.music.event.Subscriber;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicModelImpl$$Lambda$1 implements Subscriber {
    private final MusicModelImpl arg$1;

    private MusicModelImpl$$Lambda$1(MusicModelImpl musicModelImpl) {
        this.arg$1 = musicModelImpl;
    }

    public static Subscriber lambdaFactory$(MusicModelImpl musicModelImpl) {
        return new MusicModelImpl$$Lambda$1(musicModelImpl);
    }

    @Override // com.vk.music.event.Subscriber
    @LambdaForm.Hidden
    public void onEvent(Event event) {
        this.arg$1.lambda$new$1((PlaylistChanged) event);
    }
}
