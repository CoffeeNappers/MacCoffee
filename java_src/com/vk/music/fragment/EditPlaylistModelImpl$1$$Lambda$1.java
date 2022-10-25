package com.vk.music.fragment;

import com.vk.music.dto.Playlist;
import com.vk.music.fragment.EditPlaylistModelImpl;
import com.vk.music.model.EditPlaylistModel;
import com.vk.music.model.ObservableModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class EditPlaylistModelImpl$1$$Lambda$1 implements ObservableModel.Notification {
    private final EditPlaylistModelImpl.AnonymousClass1 arg$1;
    private final Playlist arg$2;

    private EditPlaylistModelImpl$1$$Lambda$1(EditPlaylistModelImpl.AnonymousClass1 anonymousClass1, Playlist playlist) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = playlist;
    }

    public static ObservableModel.Notification lambdaFactory$(EditPlaylistModelImpl.AnonymousClass1 anonymousClass1, Playlist playlist) {
        return new EditPlaylistModelImpl$1$$Lambda$1(anonymousClass1, playlist);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0(this.arg$2, (EditPlaylistModel.Callback) obj);
    }
}
