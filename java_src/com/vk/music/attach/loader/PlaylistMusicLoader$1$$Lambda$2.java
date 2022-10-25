package com.vk.music.attach.loader;

import com.vk.music.attach.loader.PlaylistMusicLoader;
import com.vkontakte.android.api.audio.AudioGetPlaylist;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistMusicLoader$1$$Lambda$2 implements PlaylistMusicLoader.Notification {
    private final PlaylistMusicLoader.AnonymousClass1 arg$1;
    private final AudioGetPlaylist.Result arg$2;

    private PlaylistMusicLoader$1$$Lambda$2(PlaylistMusicLoader.AnonymousClass1 anonymousClass1, AudioGetPlaylist.Result result) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = result;
    }

    public static PlaylistMusicLoader.Notification lambdaFactory$(PlaylistMusicLoader.AnonymousClass1 anonymousClass1, AudioGetPlaylist.Result result) {
        return new PlaylistMusicLoader$1$$Lambda$2(anonymousClass1, result);
    }

    @Override // com.vk.music.attach.loader.PlaylistMusicLoader.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$1(this.arg$2, (PlaylistMusicLoader.Callback) obj);
    }
}
