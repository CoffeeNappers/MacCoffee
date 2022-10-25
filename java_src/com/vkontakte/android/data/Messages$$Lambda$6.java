package com.vkontakte.android.data;

import com.vkontakte.android.Message;
import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class Messages$$Lambda$6 implements Friends.GetUsersCallback {
    private final Message arg$1;

    private Messages$$Lambda$6(Message message) {
        this.arg$1 = message;
    }

    public static Friends.GetUsersCallback lambdaFactory$(Message message) {
        return new Messages$$Lambda$6(message);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        Messages.lambda$broadcastNewMessage$6(this.arg$1, arrayList);
    }
}
