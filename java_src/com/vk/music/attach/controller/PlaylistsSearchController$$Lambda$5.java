package com.vk.music.attach.controller;

import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsSearchController$$Lambda$5 implements F1 {
    private final PlaylistsSearchController arg$1;
    private final LayoutInflater arg$2;

    private PlaylistsSearchController$$Lambda$5(PlaylistsSearchController playlistsSearchController, LayoutInflater layoutInflater) {
        this.arg$1 = playlistsSearchController;
        this.arg$2 = layoutInflater;
    }

    public static F1 lambdaFactory$(PlaylistsSearchController playlistsSearchController, LayoutInflater layoutInflater) {
        return new PlaylistsSearchController$$Lambda$5(playlistsSearchController, layoutInflater);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return this.arg$1.lambda$onViewAttached$4(this.arg$2, (ViewGroup) obj);
    }
}
