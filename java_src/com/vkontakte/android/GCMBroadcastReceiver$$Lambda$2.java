package com.vkontakte.android;

import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final /* synthetic */ class GCMBroadcastReceiver$$Lambda$2 implements Friends.GetUsersCallback {
    private final Message arg$1;

    private GCMBroadcastReceiver$$Lambda$2(Message message) {
        this.arg$1 = message;
    }

    public static Friends.GetUsersCallback lambdaFactory$(Message message) {
        return new GCMBroadcastReceiver$$Lambda$2(message);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        GCMBroadcastReceiver.lambda$showMessageNotification$12(this.arg$1, arrayList);
    }
}
