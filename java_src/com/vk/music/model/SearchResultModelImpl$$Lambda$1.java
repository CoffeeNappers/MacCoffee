package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.SearchResultModel;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchResultModelImpl$$Lambda$1 implements ObservableModel.Notification {
    private final SearchResultModelImpl arg$1;

    private SearchResultModelImpl$$Lambda$1(SearchResultModelImpl searchResultModelImpl) {
        this.arg$1 = searchResultModelImpl;
    }

    public static ObservableModel.Notification lambdaFactory$(SearchResultModelImpl searchResultModelImpl) {
        return new SearchResultModelImpl$$Lambda$1(searchResultModelImpl);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$setQuery$0((SearchResultModel.Callback) obj);
    }
}
