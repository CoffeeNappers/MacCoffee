package com.vk.music.fragment.menu;

import com.vk.music.dto.Playlist;
import com.vk.music.view.adapter.IdResolver;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PlaylistActionsBottomSheet$$Lambda$3 implements IdResolver {
    private static final PlaylistActionsBottomSheet$$Lambda$3 instance = new PlaylistActionsBottomSheet$$Lambda$3();

    private PlaylistActionsBottomSheet$$Lambda$3() {
    }

    public static IdResolver lambdaFactory$() {
        return instance;
    }

    @Override // com.vk.music.view.adapter.IdResolver
    @LambdaForm.Hidden
    public long resolve(Object obj) {
        long j;
        Playlist playlist = (Playlist) obj;
        return j;
    }
}
