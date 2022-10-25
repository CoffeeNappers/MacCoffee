package com.vk.music.view;

import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistsContainer$$Lambda$6 implements F1 {
    private final PlaylistsContainer arg$1;

    private PlaylistsContainer$$Lambda$6(PlaylistsContainer playlistsContainer) {
        this.arg$1 = playlistsContainer;
    }

    public static F1 lambdaFactory$(PlaylistsContainer playlistsContainer) {
        return new PlaylistsContainer$$Lambda$6(playlistsContainer);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return this.arg$1.lambda$new$3((ViewGroup) obj);
    }
}
