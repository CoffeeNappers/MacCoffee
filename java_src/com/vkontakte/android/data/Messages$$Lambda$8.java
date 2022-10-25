package com.vkontakte.android.data;

import com.vkontakte.android.data.Messages;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class Messages$$Lambda$8 implements Runnable {
    private final int arg$1;
    private final Messages.GetChatUsersCallback arg$2;

    private Messages$$Lambda$8(int i, Messages.GetChatUsersCallback getChatUsersCallback) {
        this.arg$1 = i;
        this.arg$2 = getChatUsersCallback;
    }

    public static Runnable lambdaFactory$(int i, Messages.GetChatUsersCallback getChatUsersCallback) {
        return new Messages$$Lambda$8(i, getChatUsersCallback);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Messages.lambda$getChatUsers$8(this.arg$1, this.arg$2);
    }
}
