package com.vk.music.view;

import android.content.DialogInterface;
import com.vk.music.dto.Playlist;
import com.vk.music.view.PlaylistsContainer;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistsContainer$UserListener$$Lambda$1 implements DialogInterface.OnClickListener {
    private final PlaylistsContainer.UserListener arg$1;
    private final Playlist arg$2;

    private PlaylistsContainer$UserListener$$Lambda$1(PlaylistsContainer.UserListener userListener, Playlist playlist) {
        this.arg$1 = userListener;
        this.arg$2 = playlist;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(PlaylistsContainer.UserListener userListener, Playlist playlist) {
        return new PlaylistsContainer$UserListener$$Lambda$1(userListener, playlist);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onActionClick$0(this.arg$2, dialogInterface, i);
    }
}
