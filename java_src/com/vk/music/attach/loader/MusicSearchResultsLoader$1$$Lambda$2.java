package com.vk.music.attach.loader;

import com.vk.music.attach.loader.MusicSearchResultsLoader;
import com.vk.music.dto.MusicSearchResult;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicSearchResultsLoader$1$$Lambda$2 implements MusicSearchResultsLoader.Notification {
    private final MusicSearchResultsLoader.AnonymousClass1 arg$1;
    private final MusicSearchResult arg$2;

    private MusicSearchResultsLoader$1$$Lambda$2(MusicSearchResultsLoader.AnonymousClass1 anonymousClass1, MusicSearchResult musicSearchResult) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = musicSearchResult;
    }

    public static MusicSearchResultsLoader.Notification lambdaFactory$(MusicSearchResultsLoader.AnonymousClass1 anonymousClass1, MusicSearchResult musicSearchResult) {
        return new MusicSearchResultsLoader$1$$Lambda$2(anonymousClass1, musicSearchResult);
    }

    @Override // com.vk.music.attach.loader.MusicSearchResultsLoader.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$1(this.arg$2, (MusicSearchResultsLoader.Callback) obj);
    }
}
