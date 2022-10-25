package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.SearchSuggestionModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchSuggestionModelImpl$$Lambda$1 implements ObservableModel.Notification {
    private final SearchSuggestionModelImpl arg$1;

    private SearchSuggestionModelImpl$$Lambda$1(SearchSuggestionModelImpl searchSuggestionModelImpl) {
        this.arg$1 = searchSuggestionModelImpl;
    }

    public static ObservableModel.Notification lambdaFactory$(SearchSuggestionModelImpl searchSuggestionModelImpl) {
        return new SearchSuggestionModelImpl$$Lambda$1(searchSuggestionModelImpl);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$addRecent$0((SearchSuggestionModel.Callback) obj);
    }
}
