package com.vk.music.model;

import com.vk.music.event.Event;
import com.vk.music.event.PlaylistChanged;
import com.vk.music.event.Subscriber;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistModelImpl$$Lambda$1 implements Subscriber {
    private final PlaylistModelImpl arg$1;

    private PlaylistModelImpl$$Lambda$1(PlaylistModelImpl playlistModelImpl) {
        this.arg$1 = playlistModelImpl;
    }

    public static Subscriber lambdaFactory$(PlaylistModelImpl playlistModelImpl) {
        return new PlaylistModelImpl$$Lambda$1(playlistModelImpl);
    }

    @Override // com.vk.music.event.Subscriber
    @LambdaForm.Hidden
    public void onEvent(Event event) {
        this.arg$1.lambda$new$1((PlaylistChanged) event);
    }
}
