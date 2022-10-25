package com.vkontakte.android.fragments.messages;

import android.content.DialogInterface;
import com.vkontakte.android.Message;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$20 implements DialogInterface.OnClickListener {
    private final ChatFragment arg$1;
    private final ArrayList arg$2;
    private final Message arg$3;

    private ChatFragment$$Lambda$20(ChatFragment chatFragment, ArrayList arrayList, Message message) {
        this.arg$1 = chatFragment;
        this.arg$2 = arrayList;
        this.arg$3 = message;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ChatFragment chatFragment, ArrayList arrayList, Message message) {
        return new ChatFragment$$Lambda$20(chatFragment, arrayList, message);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showMessageOptions$20(this.arg$2, this.arg$3, dialogInterface, i);
    }
}
