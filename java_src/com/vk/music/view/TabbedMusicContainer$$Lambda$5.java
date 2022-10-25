package com.vk.music.view;

import com.vk.music.view.MusicContainer;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class TabbedMusicContainer$$Lambda$5 implements MusicContainer.Host {
    private final TabbedMusicContainer arg$1;

    private TabbedMusicContainer$$Lambda$5(TabbedMusicContainer tabbedMusicContainer) {
        this.arg$1 = tabbedMusicContainer;
    }

    public static MusicContainer.Host lambdaFactory$(TabbedMusicContainer tabbedMusicContainer) {
        return new TabbedMusicContainer$$Lambda$5(tabbedMusicContainer);
    }

    @Override // com.vk.music.view.MusicContainer.Host
    @LambdaForm.Hidden
    public void requestPlaylist() {
        this.arg$1.lambda$new$4();
    }
}
