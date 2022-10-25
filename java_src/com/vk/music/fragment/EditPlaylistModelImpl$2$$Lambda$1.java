package com.vk.music.fragment;

import com.vk.music.fragment.EditPlaylistModelImpl;
import com.vk.music.model.EditPlaylistModel;
import com.vk.music.model.ObservableModel;
import com.vkontakte.android.api.audio.AudioGetPlaylist;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditPlaylistModelImpl$2$$Lambda$1 implements ObservableModel.Notification {
    private final EditPlaylistModelImpl.AnonymousClass2 arg$1;
    private final AudioGetPlaylist.Result arg$2;

    private EditPlaylistModelImpl$2$$Lambda$1(EditPlaylistModelImpl.AnonymousClass2 anonymousClass2, AudioGetPlaylist.Result result) {
        this.arg$1 = anonymousClass2;
        this.arg$2 = result;
    }

    public static ObservableModel.Notification lambdaFactory$(EditPlaylistModelImpl.AnonymousClass2 anonymousClass2, AudioGetPlaylist.Result result) {
        return new EditPlaylistModelImpl$2$$Lambda$1(anonymousClass2, result);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0(this.arg$2, (EditPlaylistModel.Callback) obj);
    }
}
