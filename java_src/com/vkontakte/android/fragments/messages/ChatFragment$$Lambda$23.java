package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.data.Friends;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$23 implements Friends.GetUsersCallback {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$23(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static Friends.GetUsersCallback lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$23(chatFragment);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        this.arg$1.lambda$loadFwdUsers$24(arrayList);
    }
}
