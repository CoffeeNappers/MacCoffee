package com.vk.music.view;

import com.vk.music.model.SearchResultModel;
import com.vkontakte.android.functions.VoidF;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SearchResultContainer$$Lambda$8 implements VoidF {
    private final SearchResultContainer arg$1;
    private final SearchResultModel arg$2;

    private SearchResultContainer$$Lambda$8(SearchResultContainer searchResultContainer, SearchResultModel searchResultModel) {
        this.arg$1 = searchResultContainer;
        this.arg$2 = searchResultModel;
    }

    public static VoidF lambdaFactory$(SearchResultContainer searchResultContainer, SearchResultModel searchResultModel) {
        return new SearchResultContainer$$Lambda$8(searchResultContainer, searchResultModel);
    }

    @Override // com.vkontakte.android.functions.VoidF
    @LambdaForm.Hidden
    public void f() {
        this.arg$1.lambda$new$6(this.arg$2);
    }
}
