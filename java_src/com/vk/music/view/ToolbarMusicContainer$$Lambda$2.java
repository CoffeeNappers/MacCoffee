package com.vk.music.view;

import com.vk.music.view.MusicContainer;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ToolbarMusicContainer$$Lambda$2 implements MusicContainer.Host {
    private final ToolbarMusicContainer arg$1;

    private ToolbarMusicContainer$$Lambda$2(ToolbarMusicContainer toolbarMusicContainer) {
        this.arg$1 = toolbarMusicContainer;
    }

    public static MusicContainer.Host lambdaFactory$(ToolbarMusicContainer toolbarMusicContainer) {
        return new ToolbarMusicContainer$$Lambda$2(toolbarMusicContainer);
    }

    @Override // com.vk.music.view.MusicContainer.Host
    @LambdaForm.Hidden
    public void requestPlaylist() {
        this.arg$1.lambda$new$1();
    }
}
