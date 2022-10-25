package com.vk.music.model;

import com.vk.music.event.Event;
import com.vk.music.event.PlaylistCreated;
import com.vk.music.event.Subscriber;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsModelImpl$$Lambda$2 implements Subscriber {
    private final PlaylistsModelImpl arg$1;

    private PlaylistsModelImpl$$Lambda$2(PlaylistsModelImpl playlistsModelImpl) {
        this.arg$1 = playlistsModelImpl;
    }

    public static Subscriber lambdaFactory$(PlaylistsModelImpl playlistsModelImpl) {
        return new PlaylistsModelImpl$$Lambda$2(playlistsModelImpl);
    }

    @Override // com.vk.music.event.Subscriber
    @LambdaForm.Hidden
    public void onEvent(Event event) {
        this.arg$1.lambda$new$3((PlaylistCreated) event);
    }
}
