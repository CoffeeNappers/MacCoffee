package com.vk.music.attach.controller;

import com.vkontakte.android.functions.VoidF;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MyMusicSearchController$$Lambda$2 implements VoidF {
    private final MyMusicSearchController arg$1;

    private MyMusicSearchController$$Lambda$2(MyMusicSearchController myMusicSearchController) {
        this.arg$1 = myMusicSearchController;
    }

    public static VoidF lambdaFactory$(MyMusicSearchController myMusicSearchController) {
        return new MyMusicSearchController$$Lambda$2(myMusicSearchController);
    }

    @Override // com.vkontakte.android.functions.VoidF
    @LambdaForm.Hidden
    public void f() {
        this.arg$1.onRetryButtonClick();
    }
}
