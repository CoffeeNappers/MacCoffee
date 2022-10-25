package com.vk.music.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchSuggestionContainer$$Lambda$10 implements View.OnClickListener {
    private final SearchSuggestionContainer arg$1;

    private SearchSuggestionContainer$$Lambda$10(SearchSuggestionContainer searchSuggestionContainer) {
        this.arg$1 = searchSuggestionContainer;
    }

    public static View.OnClickListener lambdaFactory$(SearchSuggestionContainer searchSuggestionContainer) {
        return new SearchSuggestionContainer$$Lambda$10(searchSuggestionContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$null$2(view);
    }
}
