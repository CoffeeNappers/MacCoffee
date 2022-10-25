package com.vk.music.model;

import com.vk.music.model.MusicModel;
import com.vk.music.model.MusicModelImpl;
import com.vk.music.model.ObservableModel;
import com.vkontakte.android.api.audio.AudioGetMusicPage;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicModelImpl$1$$Lambda$2 implements ObservableModel.Notification {
    private final MusicModelImpl.AnonymousClass1 arg$1;
    private final AudioGetMusicPage.Result arg$2;

    private MusicModelImpl$1$$Lambda$2(MusicModelImpl.AnonymousClass1 anonymousClass1, AudioGetMusicPage.Result result) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = result;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicModelImpl.AnonymousClass1 anonymousClass1, AudioGetMusicPage.Result result) {
        return new MusicModelImpl$1$$Lambda$2(anonymousClass1, result);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$1(this.arg$2, (MusicModel.Callback) obj);
    }
}
