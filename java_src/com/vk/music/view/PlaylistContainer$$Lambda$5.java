package com.vk.music.view;

import com.vk.music.view.adapter.IdResolver;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PlaylistContainer$$Lambda$5 implements IdResolver {
    private static final PlaylistContainer$$Lambda$5 instance = new PlaylistContainer$$Lambda$5();

    private PlaylistContainer$$Lambda$5() {
    }

    public static IdResolver lambdaFactory$() {
        return instance;
    }

    @Override // com.vk.music.view.adapter.IdResolver
    @LambdaForm.Hidden
    public long resolve(Object obj) {
        return ((MusicTrack) obj).getMidId();
    }
}
