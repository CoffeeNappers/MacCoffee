package com.vk.music.view;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistContainer$UserListener$$Lambda$4 implements DialogInterface.OnClickListener {
    private static final PlaylistContainer$UserListener$$Lambda$4 instance = new PlaylistContainer$UserListener$$Lambda$4();

    private PlaylistContainer$UserListener$$Lambda$4() {
    }

    public static DialogInterface.OnClickListener lambdaFactory$() {
        return instance;
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        dialogInterface.dismiss();
    }
}
