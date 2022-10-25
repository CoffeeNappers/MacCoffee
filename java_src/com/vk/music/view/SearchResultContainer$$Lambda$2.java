package com.vk.music.view;

import com.vk.music.view.adapter.IdResolver;
import com.vkontakte.android.api.Group;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class SearchResultContainer$$Lambda$2 implements IdResolver {
    private static final SearchResultContainer$$Lambda$2 instance = new SearchResultContainer$$Lambda$2();

    private SearchResultContainer$$Lambda$2() {
    }

    public static IdResolver lambdaFactory$() {
        return instance;
    }

    @Override // com.vk.music.view.adapter.IdResolver
    @LambdaForm.Hidden
    public long resolve(Object obj) {
        long j;
        Group group = (Group) obj;
        return j;
    }
}
