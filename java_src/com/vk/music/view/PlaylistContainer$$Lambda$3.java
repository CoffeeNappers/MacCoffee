package com.vk.music.view;

import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistContainer$$Lambda$3 implements F1 {
    private final PlaylistContainer arg$1;

    private PlaylistContainer$$Lambda$3(PlaylistContainer playlistContainer) {
        this.arg$1 = playlistContainer;
    }

    public static F1 lambdaFactory$(PlaylistContainer playlistContainer) {
        return new PlaylistContainer$$Lambda$3(playlistContainer);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return this.arg$1.lambda$new$3((ViewGroup) obj);
    }
}
