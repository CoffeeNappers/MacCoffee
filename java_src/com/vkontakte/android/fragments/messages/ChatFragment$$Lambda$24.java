package com.vkontakte.android.fragments.messages;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$24 implements Runnable {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$24(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static Runnable lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$24(chatFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$updateMentionsVisibility$25();
    }
}
