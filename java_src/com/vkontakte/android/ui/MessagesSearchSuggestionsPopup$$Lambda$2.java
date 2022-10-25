package com.vkontakte.android.ui;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MessagesSearchSuggestionsPopup$$Lambda$2 implements View.OnClickListener {
    private final MessagesSearchSuggestionsPopup arg$1;

    private MessagesSearchSuggestionsPopup$$Lambda$2(MessagesSearchSuggestionsPopup messagesSearchSuggestionsPopup) {
        this.arg$1 = messagesSearchSuggestionsPopup;
    }

    public static View.OnClickListener lambdaFactory$(MessagesSearchSuggestionsPopup messagesSearchSuggestionsPopup) {
        return new MessagesSearchSuggestionsPopup$$Lambda$2(messagesSearchSuggestionsPopup);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$2(view);
    }
}
