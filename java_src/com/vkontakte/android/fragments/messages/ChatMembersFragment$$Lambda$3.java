package com.vkontakte.android.fragments.messages;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatMembersFragment$$Lambda$3 implements DialogInterface.OnClickListener {
    private final ChatMembersFragment arg$1;

    private ChatMembersFragment$$Lambda$3(ChatMembersFragment chatMembersFragment) {
        this.arg$1 = chatMembersFragment;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ChatMembersFragment chatMembersFragment) {
        return new ChatMembersFragment$$Lambda$3(chatMembersFragment);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showDndDialog$2(dialogInterface, i);
    }
}
