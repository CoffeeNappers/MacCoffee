package com.vk.music.view;

import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.vkontakte.android.functions.F1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchSuggestionContainer$$Lambda$7 implements F1 {
    private final SearchSuggestionContainer arg$1;
    private final LayoutInflater arg$2;

    private SearchSuggestionContainer$$Lambda$7(SearchSuggestionContainer searchSuggestionContainer, LayoutInflater layoutInflater) {
        this.arg$1 = searchSuggestionContainer;
        this.arg$2 = layoutInflater;
    }

    public static F1 lambdaFactory$(SearchSuggestionContainer searchSuggestionContainer, LayoutInflater layoutInflater) {
        return new SearchSuggestionContainer$$Lambda$7(searchSuggestionContainer, layoutInflater);
    }

    @Override // com.vkontakte.android.functions.F1
    @LambdaForm.Hidden
    public Object f(Object obj) {
        return this.arg$1.lambda$new$8(this.arg$2, (ViewGroup) obj);
    }
}
