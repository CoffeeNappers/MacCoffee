package com.vk.music.attach.controller;

import com.vkontakte.android.functions.VoidF;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MyMusicController$$Lambda$2 implements VoidF {
    private final MyMusicController arg$1;

    private MyMusicController$$Lambda$2(MyMusicController myMusicController) {
        this.arg$1 = myMusicController;
    }

    public static VoidF lambdaFactory$(MyMusicController myMusicController) {
        return new MyMusicController$$Lambda$2(myMusicController);
    }

    @Override // com.vkontakte.android.functions.VoidF
    @LambdaForm.Hidden
    public void f() {
        MyMusicController.access$lambda$0(this.arg$1);
    }
}
