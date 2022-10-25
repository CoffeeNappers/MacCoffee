package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.SearchSuggestionModel;
import com.vk.music.model.SearchSuggestionModelImpl;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchSuggestionModelImpl$1$$Lambda$1 implements ObservableModel.Notification {
    private final SearchSuggestionModelImpl.AnonymousClass1 arg$1;

    private SearchSuggestionModelImpl$1$$Lambda$1(SearchSuggestionModelImpl.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static ObservableModel.Notification lambdaFactory$(SearchSuggestionModelImpl.AnonymousClass1 anonymousClass1) {
        return new SearchSuggestionModelImpl$1$$Lambda$1(anonymousClass1);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0((SearchSuggestionModel.Callback) obj);
    }
}
