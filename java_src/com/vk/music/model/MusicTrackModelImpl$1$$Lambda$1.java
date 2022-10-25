package com.vk.music.model;

import com.vk.music.model.MusicTrackModel;
import com.vk.music.model.MusicTrackModelImpl;
import com.vk.music.model.ObservableModel;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicTrackModelImpl$1$$Lambda$1 implements ObservableModel.Notification {
    private final MusicTrackModelImpl.AnonymousClass1 arg$1;
    private final MusicTrack arg$2;

    private MusicTrackModelImpl$1$$Lambda$1(MusicTrackModelImpl.AnonymousClass1 anonymousClass1, MusicTrack musicTrack) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = musicTrack;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicTrackModelImpl.AnonymousClass1 anonymousClass1, MusicTrack musicTrack) {
        return new MusicTrackModelImpl$1$$Lambda$1(anonymousClass1, musicTrack);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0(this.arg$2, (MusicTrackModel.Callback) obj);
    }
}
