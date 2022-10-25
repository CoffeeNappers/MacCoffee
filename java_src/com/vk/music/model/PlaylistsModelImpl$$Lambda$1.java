package com.vk.music.model;

import com.vk.music.event.Event;
import com.vk.music.event.PlaylistChanged;
import com.vk.music.event.Subscriber;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsModelImpl$$Lambda$1 implements Subscriber {
    private final PlaylistsModelImpl arg$1;

    private PlaylistsModelImpl$$Lambda$1(PlaylistsModelImpl playlistsModelImpl) {
        this.arg$1 = playlistsModelImpl;
    }

    public static Subscriber lambdaFactory$(PlaylistsModelImpl playlistsModelImpl) {
        return new PlaylistsModelImpl$$Lambda$1(playlistsModelImpl);
    }

    @Override // com.vk.music.event.Subscriber
    @LambdaForm.Hidden
    public void onEvent(Event event) {
        this.arg$1.lambda$new$1((PlaylistChanged) event);
    }
}
