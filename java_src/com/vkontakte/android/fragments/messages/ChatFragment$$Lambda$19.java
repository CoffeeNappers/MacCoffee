package com.vkontakte.android.fragments.messages;

import android.content.DialogInterface;
import com.vkontakte.android.Message;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$19 implements DialogInterface.OnClickListener {
    private final ChatFragment arg$1;
    private final Message arg$2;

    private ChatFragment$$Lambda$19(ChatFragment chatFragment, Message message) {
        this.arg$1 = chatFragment;
        this.arg$2 = message;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ChatFragment chatFragment, Message message) {
        return new ChatFragment$$Lambda$19(chatFragment, message);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onItemClick$19(this.arg$2, dialogInterface, i);
    }
}
