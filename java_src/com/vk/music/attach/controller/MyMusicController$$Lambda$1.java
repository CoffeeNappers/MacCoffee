package com.vk.music.attach.controller;

import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MyMusicController$$Lambda$1 implements F1 {
    private final MyMusicController arg$1;
    private final LayoutInflater arg$2;

    private MyMusicController$$Lambda$1(MyMusicController myMusicController, LayoutInflater layoutInflater) {
        this.arg$1 = myMusicController;
        this.arg$2 = layoutInflater;
    }

    public static F1 lambdaFactory$(MyMusicController myMusicController, LayoutInflater layoutInflater) {
        return new MyMusicController$$Lambda$1(myMusicController, layoutInflater);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return this.arg$1.lambda$onViewAttached$1(this.arg$2, (ViewGroup) obj);
    }
}
