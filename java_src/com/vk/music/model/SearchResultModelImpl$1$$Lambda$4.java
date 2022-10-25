package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.SearchResultModel;
import com.vk.music.model.SearchResultModelImpl;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchResultModelImpl$1$$Lambda$4 implements ObservableModel.Notification {
    private final SearchResultModelImpl.AnonymousClass1 arg$1;
    private final VKAPIRequest.VKErrorResponse arg$2;

    private SearchResultModelImpl$1$$Lambda$4(SearchResultModelImpl.AnonymousClass1 anonymousClass1, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = vKErrorResponse;
    }

    public static ObservableModel.Notification lambdaFactory$(SearchResultModelImpl.AnonymousClass1 anonymousClass1, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new SearchResultModelImpl$1$$Lambda$4(anonymousClass1, vKErrorResponse);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$3(this.arg$2, (SearchResultModel.Callback) obj);
    }
}
