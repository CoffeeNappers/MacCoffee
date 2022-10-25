package com.vk.music.model;

import com.vk.music.model.MusicTrackModel;
import com.vk.music.model.MusicTrackModelImpl;
import com.vk.music.model.ObservableModel;
import com.vkontakte.android.api.audio.AudioRemoveFromPlaylist;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicTrackModelImpl$2$$Lambda$1 implements ObservableModel.Notification {
    private final MusicTrackModelImpl.AnonymousClass2 arg$1;
    private final AudioRemoveFromPlaylist.Result arg$2;
    private final MusicTrack arg$3;

    private MusicTrackModelImpl$2$$Lambda$1(MusicTrackModelImpl.AnonymousClass2 anonymousClass2, AudioRemoveFromPlaylist.Result result, MusicTrack musicTrack) {
        this.arg$1 = anonymousClass2;
        this.arg$2 = result;
        this.arg$3 = musicTrack;
    }

    public static ObservableModel.Notification lambdaFactory$(MusicTrackModelImpl.AnonymousClass2 anonymousClass2, AudioRemoveFromPlaylist.Result result, MusicTrack musicTrack) {
        return new MusicTrackModelImpl$2$$Lambda$1(anonymousClass2, result, musicTrack);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0(this.arg$2, this.arg$3, (MusicTrackModel.Callback) obj);
    }
}
