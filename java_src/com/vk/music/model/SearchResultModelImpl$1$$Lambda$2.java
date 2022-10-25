package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.SearchResultModel;
import com.vk.music.model.SearchResultModelImpl;
import java.lang.invoke.LambdaForm;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SearchResultModelImpl$1$$Lambda$2 implements ObservableModel.Notification {
    private final SearchResultModelImpl.AnonymousClass1 arg$1;
    private final List arg$2;
    private final List arg$3;

    private SearchResultModelImpl$1$$Lambda$2(SearchResultModelImpl.AnonymousClass1 anonymousClass1, List list, List list2) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = list;
        this.arg$3 = list2;
    }

    public static ObservableModel.Notification lambdaFactory$(SearchResultModelImpl.AnonymousClass1 anonymousClass1, List list, List list2) {
        return new SearchResultModelImpl$1$$Lambda$2(anonymousClass1, list, list2);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$success$1(this.arg$2, this.arg$3, (SearchResultModel.Callback) obj);
    }
}
