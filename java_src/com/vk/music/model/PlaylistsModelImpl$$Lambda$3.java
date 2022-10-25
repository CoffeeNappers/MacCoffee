package com.vk.music.model;

import com.vk.music.event.Event;
import com.vk.music.event.PlaylistRemoved;
import com.vk.music.event.Subscriber;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsModelImpl$$Lambda$3 implements Subscriber {
    private final PlaylistsModelImpl arg$1;

    private PlaylistsModelImpl$$Lambda$3(PlaylistsModelImpl playlistsModelImpl) {
        this.arg$1 = playlistsModelImpl;
    }

    public static Subscriber lambdaFactory$(PlaylistsModelImpl playlistsModelImpl) {
        return new PlaylistsModelImpl$$Lambda$3(playlistsModelImpl);
    }

    @Override // com.vk.music.event.Subscriber
    @LambdaForm.Hidden
    public void onEvent(Event event) {
        this.arg$1.lambda$new$5((PlaylistRemoved) event);
    }
}
