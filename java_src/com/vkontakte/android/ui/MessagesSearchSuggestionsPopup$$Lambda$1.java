package com.vkontakte.android.ui;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MessagesSearchSuggestionsPopup$$Lambda$1 implements VoidF1 {
    private final MessagesSearchSuggestionsPopup arg$1;

    private MessagesSearchSuggestionsPopup$$Lambda$1(MessagesSearchSuggestionsPopup messagesSearchSuggestionsPopup) {
        this.arg$1 = messagesSearchSuggestionsPopup;
    }

    public static VoidF1 lambdaFactory$(MessagesSearchSuggestionsPopup messagesSearchSuggestionsPopup) {
        return new MessagesSearchSuggestionsPopup$$Lambda$1(messagesSearchSuggestionsPopup);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$new$1((UserProfile) obj);
    }
}
