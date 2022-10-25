package com.vk.music.attach.loader;

import com.vk.music.attach.loader.PlaylistMusicLoader;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistMusicLoader$1$$Lambda$3 implements PlaylistMusicLoader.Notification {
    private final PlaylistMusicLoader.AnonymousClass1 arg$1;

    private PlaylistMusicLoader$1$$Lambda$3(PlaylistMusicLoader.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static PlaylistMusicLoader.Notification lambdaFactory$(PlaylistMusicLoader.AnonymousClass1 anonymousClass1) {
        return new PlaylistMusicLoader$1$$Lambda$3(anonymousClass1);
    }

    @Override // com.vk.music.attach.loader.PlaylistMusicLoader.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$2((PlaylistMusicLoader.Callback) obj);
    }
}
