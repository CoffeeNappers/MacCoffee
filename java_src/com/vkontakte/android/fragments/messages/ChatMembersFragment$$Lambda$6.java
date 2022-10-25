package com.vkontakte.android.fragments.messages;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChatMembersFragment$$Lambda$6 implements DialogInterface.OnCancelListener {
    private final ChatMembersFragment arg$1;

    private ChatMembersFragment$$Lambda$6(ChatMembersFragment chatMembersFragment) {
        this.arg$1 = chatMembersFragment;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(ChatMembersFragment chatMembersFragment) {
        return new ChatMembersFragment$$Lambda$6(chatMembersFragment);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$onActivityResult$5(dialogInterface);
    }
}
