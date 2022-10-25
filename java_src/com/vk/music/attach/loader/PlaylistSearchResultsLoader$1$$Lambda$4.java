package com.vk.music.attach.loader;

import com.vk.music.attach.loader.PlaylistSearchResultsLoader;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistSearchResultsLoader$1$$Lambda$4 implements PlaylistSearchResultsLoader.Notification {
    private final PlaylistSearchResultsLoader.AnonymousClass1 arg$1;

    private PlaylistSearchResultsLoader$1$$Lambda$4(PlaylistSearchResultsLoader.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static PlaylistSearchResultsLoader.Notification lambdaFactory$(PlaylistSearchResultsLoader.AnonymousClass1 anonymousClass1) {
        return new PlaylistSearchResultsLoader$1$$Lambda$4(anonymousClass1);
    }

    @Override // com.vk.music.attach.loader.PlaylistSearchResultsLoader.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$3((PlaylistSearchResultsLoader.Callback) obj);
    }
}
