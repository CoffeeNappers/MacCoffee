package com.vk.music.view;

import com.vk.music.model.SearchSuggestionModel;
import com.vkontakte.android.functions.VoidF;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchSuggestionContainer$$Lambda$5 implements VoidF {
    private final SearchSuggestionContainer arg$1;
    private final SearchSuggestionModel arg$2;

    private SearchSuggestionContainer$$Lambda$5(SearchSuggestionContainer searchSuggestionContainer, SearchSuggestionModel searchSuggestionModel) {
        this.arg$1 = searchSuggestionContainer;
        this.arg$2 = searchSuggestionModel;
    }

    public static VoidF lambdaFactory$(SearchSuggestionContainer searchSuggestionContainer, SearchSuggestionModel searchSuggestionModel) {
        return new SearchSuggestionContainer$$Lambda$5(searchSuggestionContainer, searchSuggestionModel);
    }

    @Override // com.vkontakte.android.functions.VoidF
    @LambdaForm.Hidden
    public void f() {
        this.arg$1.lambda$new$5(this.arg$2);
    }
}
