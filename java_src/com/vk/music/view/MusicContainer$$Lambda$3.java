package com.vk.music.view;

import com.vk.music.dto.Playlist;
import com.vk.music.view.adapter.IdResolver;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MusicContainer$$Lambda$3 implements IdResolver {
    private static final MusicContainer$$Lambda$3 instance = new MusicContainer$$Lambda$3();

    private MusicContainer$$Lambda$3() {
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
