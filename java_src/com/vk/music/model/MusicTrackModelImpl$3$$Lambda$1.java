package com.vk.music.model;

import com.vk.music.model.MusicTrackModel;
import com.vk.music.model.MusicTrackModelImpl;
import com.vk.music.model.ObservableModel;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicTrackModelImpl$3$$Lambda$1 implements ObservableModel.Notification {
    private final MusicTrackModelImpl.AnonymousClass3 arg$1;
    private final MusicTrack arg$2;

    private MusicTrackModelImpl$3$$Lambda$1(MusicTrackModelImpl.AnonymousClass3 anonymousClass3, MusicTrack musicTrack) {
        this.arg$1 = anonymousClass3;
        this.arg$2 = musicTrack;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicTrackModelImpl.AnonymousClass3 anonymousClass3, MusicTrack musicTrack) {
        return new MusicTrackModelImpl$3$$Lambda$1(anonymousClass3, musicTrack);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0(this.arg$2, (MusicTrackModel.Callback) obj);
    }
}
