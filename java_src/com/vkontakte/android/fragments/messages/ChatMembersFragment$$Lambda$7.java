package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChatMembersFragment$$Lambda$7 implements VoidF1 {
    private final ChatMembersFragment arg$1;

    private ChatMembersFragment$$Lambda$7(ChatMembersFragment chatMembersFragment) {
        this.arg$1 = chatMembersFragment;
    }

    public static VoidF1 lambdaFactory$(ChatMembersFragment chatMembersFragment) {
        return new ChatMembersFragment$$Lambda$7(chatMembersFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$onClick$6((Integer) obj);
    }
}
