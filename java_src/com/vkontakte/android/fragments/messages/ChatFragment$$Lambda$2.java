package com.vkontakte.android.fragments.messages;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChatFragment$$Lambda$2 implements Runnable {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$2(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static Runnable lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$2(chatFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        ChatFragment.access$lambda$0(this.arg$1);
    }
}
