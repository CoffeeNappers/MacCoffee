package com.vk.music.attach.loader;

import com.vk.music.attach.loader.PlaylistsLoader;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsLoader$1$$Lambda$1 implements PlaylistsLoader.Notification {
    private final PlaylistsLoader.AnonymousClass1 arg$1;

    private PlaylistsLoader$1$$Lambda$1(PlaylistsLoader.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static PlaylistsLoader.Notification lambdaFactory$(PlaylistsLoader.AnonymousClass1 anonymousClass1) {
        return new PlaylistsLoader$1$$Lambda$1(anonymousClass1);
    }

    @Override // com.vk.music.attach.loader.PlaylistsLoader.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0((PlaylistsLoader.Callback) obj);
    }
}
