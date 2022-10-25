package com.vk.music.attach.loader;

import com.vk.music.attach.loader.MusicLoader;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicLoader$1$$Lambda$3 implements MusicLoader.Notification {
    private final MusicLoader.AnonymousClass1 arg$1;

    private MusicLoader$1$$Lambda$3(MusicLoader.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static MusicLoader.Notification lambdaFactory$(MusicLoader.AnonymousClass1 anonymousClass1) {
        return new MusicLoader$1$$Lambda$3(anonymousClass1);
    }

    @Override // com.vk.music.attach.loader.MusicLoader.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$2((MusicLoader.Callback) obj);
    }
}
