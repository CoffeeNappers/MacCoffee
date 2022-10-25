package com.vk.music.attach.controller;

import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MyMusicSearchController$$Lambda$1 implements F1 {
    private final LayoutInflater arg$1;

    private MyMusicSearchController$$Lambda$1(LayoutInflater layoutInflater) {
        this.arg$1 = layoutInflater;
    }

    public static F1 lambdaFactory$(LayoutInflater layoutInflater) {
        return new MyMusicSearchController$$Lambda$1(layoutInflater);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return MyMusicSearchController.lambda$onViewAttached$0(this.arg$1, (ViewGroup) obj);
    }
}
