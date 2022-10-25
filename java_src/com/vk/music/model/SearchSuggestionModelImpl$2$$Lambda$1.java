package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.SearchSuggestionModel;
import com.vk.music.model.SearchSuggestionModelImpl;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchSuggestionModelImpl$2$$Lambda$1 implements ObservableModel.Notification {
    private final SearchSuggestionModelImpl.AnonymousClass2 arg$1;

    private SearchSuggestionModelImpl$2$$Lambda$1(SearchSuggestionModelImpl.AnonymousClass2 anonymousClass2) {
        this.arg$1 = anonymousClass2;
    }

    public static ObservableModel.Notification lambdaFactory$(SearchSuggestionModelImpl.AnonymousClass2 anonymousClass2) {
        return new SearchSuggestionModelImpl$2$$Lambda$1(anonymousClass2);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0((SearchSuggestionModel.Callback) obj);
    }
}
