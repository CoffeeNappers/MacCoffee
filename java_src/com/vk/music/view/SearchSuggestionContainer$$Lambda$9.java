package com.vk.music.view;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchSuggestionContainer$$Lambda$9 implements View.OnClickListener {
    private final SearchSuggestionContainer arg$1;

    private SearchSuggestionContainer$$Lambda$9(SearchSuggestionContainer searchSuggestionContainer) {
        this.arg$1 = searchSuggestionContainer;
    }

    public static View.OnClickListener lambdaFactory$(SearchSuggestionContainer searchSuggestionContainer) {
        return new SearchSuggestionContainer$$Lambda$9(searchSuggestionContainer);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$null$7(view);
    }
}
