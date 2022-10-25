package com.vk.music.attach.controller;

import com.vk.music.dto.Playlist;
import com.vk.music.view.adapter.IdResolver;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistsSearchController$$Lambda$3 implements IdResolver {
    private static final PlaylistsSearchController$$Lambda$3 instance = new PlaylistsSearchController$$Lambda$3();

    private PlaylistsSearchController$$Lambda$3() {
    }

    public static IdResolver lambdaFactory$() {
        return instance;
    }

    @Override // com.vk.music.view.adapter.IdResolver
    @LambdaForm.Hidden
    public long resolve(Object obj) {
        return ((Playlist) obj).getPid();
    }
}
