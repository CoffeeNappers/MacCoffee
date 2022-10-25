package com.vkontakte.android.fragments;

import com.vk.music.dto.Playlist;
import com.vk.music.view.adapter.IdResolver;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class ProfileFragment$$Lambda$31 implements IdResolver {
    private static final ProfileFragment$$Lambda$31 instance = new ProfileFragment$$Lambda$31();

    private ProfileFragment$$Lambda$31() {
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
