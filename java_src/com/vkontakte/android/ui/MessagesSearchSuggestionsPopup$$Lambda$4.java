package com.vkontakte.android.ui;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MessagesSearchSuggestionsPopup$$Lambda$4 implements Runnable {
    private final MessagesSearchSuggestionsPopup arg$1;

    private MessagesSearchSuggestionsPopup$$Lambda$4(MessagesSearchSuggestionsPopup messagesSearchSuggestionsPopup) {
        this.arg$1 = messagesSearchSuggestionsPopup;
    }

    public static Runnable lambdaFactory$(MessagesSearchSuggestionsPopup messagesSearchSuggestionsPopup) {
        return new MessagesSearchSuggestionsPopup$$Lambda$4(messagesSearchSuggestionsPopup);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0();
    }
}
