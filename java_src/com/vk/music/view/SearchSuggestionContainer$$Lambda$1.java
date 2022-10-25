package com.vk.music.view;

import android.view.View;
import com.vk.music.view.adapter.ItemViewHolder;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchSuggestionContainer$$Lambda$1 implements ItemViewHolder.Builder.Init {
    private final SearchSuggestionContainer arg$1;

    private SearchSuggestionContainer$$Lambda$1(SearchSuggestionContainer searchSuggestionContainer) {
        this.arg$1 = searchSuggestionContainer;
    }

    public static ItemViewHolder.Builder.Init lambdaFactory$(SearchSuggestionContainer searchSuggestionContainer) {
        return new SearchSuggestionContainer$$Lambda$1(searchSuggestionContainer);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.Builder.Init
    @LambdaForm.Hidden
    public void apply(View view) {
        this.arg$1.lambda$new$0(view);
    }
}
