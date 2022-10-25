package com.vk.music.attach.controller;

import com.vk.music.view.adapter.IdResolver;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AdapterHelper$$Lambda$3 implements IdResolver {
    private static final AdapterHelper$$Lambda$3 instance = new AdapterHelper$$Lambda$3();

    private AdapterHelper$$Lambda$3() {
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
