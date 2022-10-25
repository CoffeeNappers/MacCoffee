package com.vkontakte.android.audio.player;

import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.player.proxy.PlayerProxy;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MediaPlayerHelperI$$Lambda$1 implements MediaPlayerHelperI.UrlCreator {
    private static final MediaPlayerHelperI$$Lambda$1 instance = new MediaPlayerHelperI$$Lambda$1();

    private MediaPlayerHelperI$$Lambda$1() {
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.UrlCreator
    @LambdaForm.Hidden
    public String createUrl(String str, String str2) {
        return PlayerProxy.createUrl(str, str2);
    }
}
