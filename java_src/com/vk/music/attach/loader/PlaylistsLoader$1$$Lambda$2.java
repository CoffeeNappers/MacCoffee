package com.vk.music.attach.loader;

import com.vk.music.attach.loader.PlaylistsLoader;
import com.vkontakte.android.data.VKList;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsLoader$1$$Lambda$2 implements PlaylistsLoader.Notification {
    private final PlaylistsLoader.AnonymousClass1 arg$1;
    private final VKList arg$2;

    private PlaylistsLoader$1$$Lambda$2(PlaylistsLoader.AnonymousClass1 anonymousClass1, VKList vKList) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = vKList;
    }

    public static PlaylistsLoader.Notification lambdaFactory$(PlaylistsLoader.AnonymousClass1 anonymousClass1, VKList vKList) {
        return new PlaylistsLoader$1$$Lambda$2(anonymousClass1, vKList);
    }

    @Override // com.vk.music.attach.loader.PlaylistsLoader.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$1(this.arg$2, (PlaylistsLoader.Callback) obj);
    }
}
