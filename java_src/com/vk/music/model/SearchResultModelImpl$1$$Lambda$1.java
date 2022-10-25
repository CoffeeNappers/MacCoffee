package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.SearchResultModel;
import com.vk.music.model.SearchResultModelImpl;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SearchResultModelImpl$1$$Lambda$1 implements ObservableModel.Notification {
    private final SearchResultModelImpl.AnonymousClass1 arg$1;

    private SearchResultModelImpl$1$$Lambda$1(SearchResultModelImpl.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static ObservableModel.Notification lambdaFactory$(SearchResultModelImpl.AnonymousClass1 anonymousClass1) {
        return new SearchResultModelImpl$1$$Lambda$1(anonymousClass1);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$0((SearchResultModel.Callback) obj);
    }
}
