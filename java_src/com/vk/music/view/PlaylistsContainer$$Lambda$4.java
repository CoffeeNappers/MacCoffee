package com.vk.music.view;

import com.vk.music.dto.Playlist;
import com.vk.music.view.adapter.IdResolver;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistsContainer$$Lambda$4 implements IdResolver {
    private static final PlaylistsContainer$$Lambda$4 instance = new PlaylistsContainer$$Lambda$4();

    private PlaylistsContainer$$Lambda$4() {
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
