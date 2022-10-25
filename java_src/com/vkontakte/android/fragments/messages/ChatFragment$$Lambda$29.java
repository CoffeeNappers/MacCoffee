package com.vkontakte.android.fragments.messages;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$29 implements Runnable {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$29(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static Runnable lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$29(chatFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.updateChatUsersPhotos();
    }
}
