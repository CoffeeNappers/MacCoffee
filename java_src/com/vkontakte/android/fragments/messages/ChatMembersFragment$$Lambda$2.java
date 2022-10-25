package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.data.Messages;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatMembersFragment$$Lambda$2 implements Messages.GetChatUsersCallback {
    private final ChatMembersFragment arg$1;

    private ChatMembersFragment$$Lambda$2(ChatMembersFragment chatMembersFragment) {
        this.arg$1 = chatMembersFragment;
    }

    public static Messages.GetChatUsersCallback lambdaFactory$(ChatMembersFragment chatMembersFragment) {
        return new ChatMembersFragment$$Lambda$2(chatMembersFragment);
    }

    @Override // com.vkontakte.android.data.Messages.GetChatUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList, String str, String str2) {
        this.arg$1.lambda$updateChatUsers$1(arrayList, str, str2);
    }
}
