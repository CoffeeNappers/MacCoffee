package com.vk.music.attach.loader;

import com.vk.music.attach.loader.PlaylistSearchResultsLoader;
import com.vk.music.dto.PlaylistSearchResult;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistSearchResultsLoader$1$$Lambda$2 implements PlaylistSearchResultsLoader.Notification {
    private final PlaylistSearchResultsLoader.AnonymousClass1 arg$1;
    private final PlaylistSearchResult arg$2;

    private PlaylistSearchResultsLoader$1$$Lambda$2(PlaylistSearchResultsLoader.AnonymousClass1 anonymousClass1, PlaylistSearchResult playlistSearchResult) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = playlistSearchResult;
    }

    public static PlaylistSearchResultsLoader.Notification lambdaFactory$(PlaylistSearchResultsLoader.AnonymousClass1 anonymousClass1, PlaylistSearchResult playlistSearchResult) {
        return new PlaylistSearchResultsLoader$1$$Lambda$2(anonymousClass1, playlistSearchResult);
    }

    @Override // com.vk.music.attach.loader.PlaylistSearchResultsLoader.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$1(this.arg$2, (PlaylistSearchResultsLoader.Callback) obj);
    }
}
