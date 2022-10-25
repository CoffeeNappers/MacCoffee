package com.vk.music.attach.loader;

import com.vk.music.attach.loader.MusicSearchResultsLoader;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicSearchResultsLoader$1$$Lambda$1 implements MusicSearchResultsLoader.Notification {
    private final MusicSearchResultsLoader.AnonymousClass1 arg$1;

    private MusicSearchResultsLoader$1$$Lambda$1(MusicSearchResultsLoader.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static MusicSearchResultsLoader.Notification lambdaFactory$(MusicSearchResultsLoader.AnonymousClass1 anonymousClass1) {
        return new MusicSearchResultsLoader$1$$Lambda$1(anonymousClass1);
    }

    @Override // com.vk.music.attach.loader.MusicSearchResultsLoader.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0((MusicSearchResultsLoader.Callback) obj);
    }
}
