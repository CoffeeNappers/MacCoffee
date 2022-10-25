package com.vk.music.view;

import android.content.DialogInterface;
import com.vk.music.view.PlaylistsContainer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsContainer$UserListener$$Lambda$2 implements DialogInterface.OnClickListener {
    private static final PlaylistsContainer$UserListener$$Lambda$2 instance = new PlaylistsContainer$UserListener$$Lambda$2();

    private PlaylistsContainer$UserListener$$Lambda$2() {
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        PlaylistsContainer.UserListener.lambda$onActionClick$1(dialogInterface, i);
    }
}
