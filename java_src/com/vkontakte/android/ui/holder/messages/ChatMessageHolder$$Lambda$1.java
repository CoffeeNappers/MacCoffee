package com.vkontakte.android.ui.holder.messages;

import android.view.View;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class ChatMessageHolder$$Lambda$1 implements View.OnClickListener {
    private final ChatMessageHolder arg$1;
    private final ArrayList arg$2;
    private final int arg$3;

    private ChatMessageHolder$$Lambda$1(ChatMessageHolder chatMessageHolder, ArrayList arrayList, int i) {
        this.arg$1 = chatMessageHolder;
        this.arg$2 = arrayList;
        this.arg$3 = i;
    }

    public static View.OnClickListener lambdaFactory$(ChatMessageHolder chatMessageHolder, ArrayList arrayList, int i) {
        return new ChatMessageHolder$$Lambda$1(chatMessageHolder, arrayList, i);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$processAttachments$0(this.arg$2, this.arg$3, view);
    }
}
