package com.vk.music.attach.loader;

import com.vk.music.attach.loader.MusicLoader;
import com.vkontakte.android.api.audio.AudioGetMusicPage;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicLoader$1$$Lambda$2 implements MusicLoader.Notification {
    private final MusicLoader.AnonymousClass1 arg$1;
    private final AudioGetMusicPage.Result arg$2;

    private MusicLoader$1$$Lambda$2(MusicLoader.AnonymousClass1 anonymousClass1, AudioGetMusicPage.Result result) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = result;
    }

    public static MusicLoader.Notification lambdaFactory$(MusicLoader.AnonymousClass1 anonymousClass1, AudioGetMusicPage.Result result) {
        return new MusicLoader$1$$Lambda$2(anonymousClass1, result);
    }

    @Override // com.vk.music.attach.loader.MusicLoader.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$1(this.arg$2, (MusicLoader.Callback) obj);
    }
}
