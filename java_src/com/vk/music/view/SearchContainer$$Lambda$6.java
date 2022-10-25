package com.vk.music.view;

import com.vk.music.view.SearchResultContainer;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SearchContainer$$Lambda$6 implements SearchResultContainer.Host {
    private final SearchContainer arg$1;

    private SearchContainer$$Lambda$6(SearchContainer searchContainer) {
        this.arg$1 = searchContainer;
    }

    public static SearchResultContainer.Host lambdaFactory$(SearchContainer searchContainer) {
        return new SearchContainer$$Lambda$6(searchContainer);
    }

    @Override // com.vk.music.view.SearchResultContainer.Host
    @LambdaForm.Hidden
    public void requestPlaylist() {
        this.arg$1.lambda$ensureSearchResultByTitleContainer$4();
    }
}
