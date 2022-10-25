package com.vk.music.attach.controller;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MyMusicController$$Lambda$3 implements View.OnClickListener {
    private final MyMusicController arg$1;

    private MyMusicController$$Lambda$3(MyMusicController myMusicController) {
        this.arg$1 = myMusicController;
    }

    public static View.OnClickListener lambdaFactory$(MyMusicController myMusicController) {
        return new MyMusicController$$Lambda$3(myMusicController);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$null$0(view);
    }
}
