package com.vk.music.attach.controller;

import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsController$$Lambda$4 implements F1 {
    private final PlaylistsController arg$1;
    private final LayoutInflater arg$2;

    private PlaylistsController$$Lambda$4(PlaylistsController playlistsController, LayoutInflater layoutInflater) {
        this.arg$1 = playlistsController;
        this.arg$2 = layoutInflater;
    }

    public static F1 lambdaFactory$(PlaylistsController playlistsController, LayoutInflater layoutInflater) {
        return new PlaylistsController$$Lambda$4(playlistsController, layoutInflater);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return this.arg$1.lambda$onViewAttached$3(this.arg$2, (ViewGroup) obj);
    }
}
