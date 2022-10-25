package com.vkontakte.android.fragments.messages;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$21 implements DialogInterface.OnClickListener {
    private final ChatFragment arg$1;
    private final List arg$2;

    private ChatFragment$$Lambda$21(ChatFragment chatFragment, List list) {
        this.arg$1 = chatFragment;
        this.arg$2 = list;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ChatFragment chatFragment, List list) {
        return new ChatFragment$$Lambda$21(chatFragment, list);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$confirmAndDelete$21(this.arg$2, dialogInterface, i);
    }
}
