package com.vk.music.view;

import android.content.DialogInterface;
import com.vk.music.view.PlaylistContainer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistContainer$UserListener$$Lambda$3 implements DialogInterface.OnClickListener {
    private final PlaylistContainer.UserListener arg$1;

    private PlaylistContainer$UserListener$$Lambda$3(PlaylistContainer.UserListener userListener) {
        this.arg$1 = userListener;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(PlaylistContainer.UserListener userListener) {
        return new PlaylistContainer$UserListener$$Lambda$3(userListener);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onMenuItemClick$2(dialogInterface, i);
    }
}
