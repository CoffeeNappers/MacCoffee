package com.vkontakte.android.fragments.messages;

import android.view.KeyEvent;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChatFragment$$Lambda$12 implements View.OnKeyListener {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$12(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static View.OnKeyListener lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$12(chatFragment);
    }

    @Override // android.view.View.OnKeyListener
    @LambdaForm.Hidden
    public boolean onKey(View view, int i, KeyEvent keyEvent) {
        return this.arg$1.lambda$onCreateContentView$10(view, i, keyEvent);
    }
}
