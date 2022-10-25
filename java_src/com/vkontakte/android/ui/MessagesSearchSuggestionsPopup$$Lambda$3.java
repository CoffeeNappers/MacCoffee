package com.vkontakte.android.ui;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class MessagesSearchSuggestionsPopup$$Lambda$3 implements Runnable {
    private final MessagesSearchSuggestionsPopup arg$1;
    private final String arg$2;

    private MessagesSearchSuggestionsPopup$$Lambda$3(MessagesSearchSuggestionsPopup messagesSearchSuggestionsPopup, String str) {
        this.arg$1 = messagesSearchSuggestionsPopup;
        this.arg$2 = str;
    }

    public static Runnable lambdaFactory$(MessagesSearchSuggestionsPopup messagesSearchSuggestionsPopup, String str) {
        return new MessagesSearchSuggestionsPopup$$Lambda$3(messagesSearchSuggestionsPopup, str);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$updateQuery$3(this.arg$2);
    }
}
