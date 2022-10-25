package com.vk.music.view;

import com.vk.music.view.SearchSuggestionContainer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchContainer$$Lambda$5 implements SearchSuggestionContainer.Listener {
    private final SearchContainer arg$1;

    private SearchContainer$$Lambda$5(SearchContainer searchContainer) {
        this.arg$1 = searchContainer;
    }

    public static SearchSuggestionContainer.Listener lambdaFactory$(SearchContainer searchContainer) {
        return new SearchContainer$$Lambda$5(searchContainer);
    }

    @Override // com.vk.music.view.SearchSuggestionContainer.Listener
    @LambdaForm.Hidden
    public void onSearchRequested() {
        SearchContainer.access$lambda$0(this.arg$1);
    }
}
