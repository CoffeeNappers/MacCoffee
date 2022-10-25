package com.vkontakte.android.audio.player;

import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.player.exo.AudioCacheHelper;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MediaPlayerHelperI$$Lambda$5 implements MediaPlayerHelperI.UrlCreator {
    private static final MediaPlayerHelperI$$Lambda$5 instance = new MediaPlayerHelperI$$Lambda$5();

    private MediaPlayerHelperI$$Lambda$5() {
    }

    @Override // com.vkontakte.android.audio.player.MediaPlayerHelperI.UrlCreator
    @LambdaForm.Hidden
    public String createUrl(String str, String str2) {
        return AudioCacheHelper.createUrlHttp(str, str2);
    }
}
