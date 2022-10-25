package com.vk.music.model;

import com.vk.music.model.ObservableModel;
import com.vk.music.model.SearchSuggestionModel;
import com.vk.music.model.SearchSuggestionModelImpl;
import com.vkontakte.android.api.VKAPIRequest;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SearchSuggestionModelImpl$1$$Lambda$2 implements ObservableModel.Notification {
    private final SearchSuggestionModelImpl.AnonymousClass1 arg$1;
    private final VKAPIRequest.VKErrorResponse arg$2;

    private SearchSuggestionModelImpl$1$$Lambda$2(SearchSuggestionModelImpl.AnonymousClass1 anonymousClass1, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = vKErrorResponse;
    }

    public static ObservableModel.Notification lambdaFactory$(SearchSuggestionModelImpl.AnonymousClass1 anonymousClass1, VKAPIRequest.VKErrorResponse vKErrorResponse) {
        return new SearchSuggestionModelImpl$1$$Lambda$2(anonymousClass1, vKErrorResponse);
    }

    @Override // com.vk.music.model.ObservableModel.Notification
    @LambdaForm.Hidden
    public void accept(Object obj) {
        this.arg$1.lambda$fail$1(this.arg$2, (SearchSuggestionModel.Callback) obj);
    }
}
