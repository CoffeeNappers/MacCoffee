package com.vkontakte.android.fragments.messages;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$5 implements View.OnLongClickListener {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$5(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static View.OnLongClickListener lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$5(chatFragment);
    }

    @Override // android.view.View.OnLongClickListener
    @LambdaForm.Hidden
    public boolean onLongClick(View view) {
        return this.arg$1.lambda$new$3(view);
    }
}
