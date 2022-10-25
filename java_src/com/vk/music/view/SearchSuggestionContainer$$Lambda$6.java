package com.vk.music.view;

import android.view.View;
import com.vk.music.view.adapter.ItemViewHolder;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchSuggestionContainer$$Lambda$6 implements ItemViewHolder.ClickListener {
    private final SearchSuggestionContainer arg$1;

    private SearchSuggestionContainer$$Lambda$6(SearchSuggestionContainer searchSuggestionContainer) {
        this.arg$1 = searchSuggestionContainer;
    }

    public static ItemViewHolder.ClickListener lambdaFactory$(SearchSuggestionContainer searchSuggestionContainer) {
        return new SearchSuggestionContainer$$Lambda$6(searchSuggestionContainer);
    }

    @Override // com.vk.music.view.adapter.ItemViewHolder.ClickListener
    @LambdaForm.Hidden
    public void onClick(View view, Object obj, int i) {
        this.arg$1.lambda$new$6(view, (String) obj, i);
    }
}
