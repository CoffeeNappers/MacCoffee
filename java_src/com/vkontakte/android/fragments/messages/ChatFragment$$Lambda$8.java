package com.vkontakte.android.fragments.messages;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChatFragment$$Lambda$8 implements View.OnClickListener {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$8(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static View.OnClickListener lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$8(chatFragment);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreateContentView$6(view);
    }
}
