package com.vk.music.view;

import android.content.DialogInterface;
import com.vk.music.view.MusicContainer;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MusicContainer$UserListener$$Lambda$1 implements DialogInterface.OnClickListener {
    private final MusicContainer.UserListener arg$1;
    private final MusicTrack arg$2;

    private MusicContainer$UserListener$$Lambda$1(MusicContainer.UserListener userListener, MusicTrack musicTrack) {
        this.arg$1 = userListener;
        this.arg$2 = musicTrack;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(MusicContainer.UserListener userListener, MusicTrack musicTrack) {
        return new MusicContainer$UserListener$$Lambda$1(userListener, musicTrack);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onActionClick$0(this.arg$2, dialogInterface, i);
    }
}
