package com.vk.music.view;

import com.vk.music.view.adapter.IdResolver;
import com.vkontakte.android.audio.MusicTrack;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SearchResultContainer$$Lambda$6 implements IdResolver {
    private static final SearchResultContainer$$Lambda$6 instance = new SearchResultContainer$$Lambda$6();

    private SearchResultContainer$$Lambda$6() {
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
