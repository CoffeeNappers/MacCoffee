package com.vkontakte.android.fragments.messages;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$4 implements View.OnClickListener {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$4(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static View.OnClickListener lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$4(chatFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$2(view);
    }
}
