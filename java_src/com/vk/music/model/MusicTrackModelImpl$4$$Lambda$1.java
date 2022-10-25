package com.vk.music.model;

import com.vk.music.model.MusicTrackModel;
import com.vk.music.model.MusicTrackModelImpl;
import com.vk.music.model.ObservableModel;
import com.vkontakte.android.api.audio.AudioAddToPlaylist;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicTrackModelImpl$4$$Lambda$1 implements ObservableModel.Notification {
    private final MusicTrackModelImpl.AnonymousClass4 arg$1;
    private final AudioAddToPlaylist.Result arg$2;

    private MusicTrackModelImpl$4$$Lambda$1(MusicTrackModelImpl.AnonymousClass4 anonymousClass4, AudioAddToPlaylist.Result result) {
        this.arg$1 = anonymousClass4;
        this.arg$2 = result;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicTrackModelImpl.AnonymousClass4 anonymousClass4, AudioAddToPlaylist.Result result) {
        return new MusicTrackModelImpl$4$$Lambda$1(anonymousClass4, result);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0(this.arg$2, (MusicTrackModel.Callback) obj);
    }
}
