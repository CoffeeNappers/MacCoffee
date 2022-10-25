package com.vk.music.view;

import com.vk.music.view.RecommendedContainer;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class TabbedMusicContainer$$Lambda$6 implements RecommendedContainer.Host {
    private final TabbedMusicContainer arg$1;

    private TabbedMusicContainer$$Lambda$6(TabbedMusicContainer tabbedMusicContainer) {
        this.arg$1 = tabbedMusicContainer;
    }

    public static RecommendedContainer.Host lambdaFactory$(TabbedMusicContainer tabbedMusicContainer) {
        return new TabbedMusicContainer$$Lambda$6(tabbedMusicContainer);
    }

    @Override // com.vk.music.view.RecommendedContainer.Host
    @LambdaForm.Hidden
    public void requestPlaylist() {
        this.arg$1.lambda$new$5();
    }
}
