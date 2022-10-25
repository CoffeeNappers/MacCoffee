package com.vk.music.view;

import android.content.DialogInterface;
import com.vk.music.view.PlaylistContainer;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistContainer$UserListener$$Lambda$1 implements DialogInterface.OnClickListener {
    private final PlaylistContainer.UserListener arg$1;
    private final MusicTrack arg$2;

    private PlaylistContainer$UserListener$$Lambda$1(PlaylistContainer.UserListener userListener, MusicTrack musicTrack) {
        this.arg$1 = userListener;
        this.arg$2 = musicTrack;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(PlaylistContainer.UserListener userListener, MusicTrack musicTrack) {
        return new PlaylistContainer$UserListener$$Lambda$1(userListener, musicTrack);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onActionClick$0(this.arg$2, dialogInterface, i);
    }
}
