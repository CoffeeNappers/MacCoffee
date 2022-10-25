package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.data.Messages;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$15 implements Messages.GetChatUsersCallback {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$15(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static Messages.GetChatUsersCallback lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$15(chatFragment);
    }

    @Override // com.vkontakte.android.data.Messages.GetChatUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList, String str, String str2) {
        this.arg$1.lambda$updateChatUsers$15(arrayList, str, str2);
    }
}
