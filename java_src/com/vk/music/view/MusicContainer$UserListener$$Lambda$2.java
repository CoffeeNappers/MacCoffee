package com.vk.music.view;

import android.content.DialogInterface;
import com.vk.music.view.MusicContainer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MusicContainer$UserListener$$Lambda$2 implements DialogInterface.OnClickListener {
    private static final MusicContainer$UserListener$$Lambda$2 instance = new MusicContainer$UserListener$$Lambda$2();

    private MusicContainer$UserListener$$Lambda$2() {
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        MusicContainer.UserListener.lambda$onActionClick$1(dialogInterface, i);
    }
}
