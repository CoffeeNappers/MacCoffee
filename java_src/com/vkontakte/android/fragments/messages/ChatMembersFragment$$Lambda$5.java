package com.vkontakte.android.fragments.messages;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChatMembersFragment$$Lambda$5 implements DialogInterface.OnClickListener {
    private static final ChatMembersFragment$$Lambda$5 instance = new ChatMembersFragment$$Lambda$5();

    private ChatMembersFragment$$Lambda$5() {
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        ChatMembersFragment.lambda$onActivityResult$4(dialogInterface, i);
    }
}
