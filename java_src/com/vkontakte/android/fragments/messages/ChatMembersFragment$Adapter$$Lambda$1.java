package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.fragments.messages.ChatMembersFragment;
import com.vkontakte.android.functions.VoidF1;
import com.vkontakte.android.ui.holder.commons.PreferenceIconItemHolder;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatMembersFragment$Adapter$$Lambda$1 implements VoidF1 {
    private final ChatMembersFragment.Adapter arg$1;

    private ChatMembersFragment$Adapter$$Lambda$1(ChatMembersFragment.Adapter adapter) {
        this.arg$1 = adapter;
    }

    public static VoidF1 lambdaFactory$(ChatMembersFragment.Adapter adapter) {
        return new ChatMembersFragment$Adapter$$Lambda$1(adapter);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$onCreateViewHolder$0((PreferenceIconItemHolder.IconPrefInfo) obj);
    }
}
