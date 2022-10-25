package com.vkontakte.android.data;

import com.vkontakte.android.Message;
import com.vkontakte.android.data.Messages;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class Messages$$Lambda$7 implements Messages.GetChatUsersCallback {
    private final Message arg$1;

    private Messages$$Lambda$7(Message message) {
        this.arg$1 = message;
    }

    public static Messages.GetChatUsersCallback lambdaFactory$(Message message) {
        return new Messages$$Lambda$7(message);
    }

    @Override // com.vkontakte.android.data.Messages.GetChatUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList, String str, String str2) {
        Messages.lambda$broadcastNewMessage$7(this.arg$1, arrayList, str, str2);
    }
}
