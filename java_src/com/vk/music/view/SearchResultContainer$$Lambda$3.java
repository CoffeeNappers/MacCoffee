package com.vk.music.view;

import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SearchResultContainer$$Lambda$3 implements F1 {
    private final SearchResultContainer arg$1;

    private SearchResultContainer$$Lambda$3(SearchResultContainer searchResultContainer) {
        this.arg$1 = searchResultContainer;
    }

    public static F1 lambdaFactory$(SearchResultContainer searchResultContainer) {
        return new SearchResultContainer$$Lambda$3(searchResultContainer);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return this.arg$1.lambda$new$2((ViewGroup) obj);
    }
}
