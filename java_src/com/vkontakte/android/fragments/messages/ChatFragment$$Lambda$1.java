package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.functions.VoidF0;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$1 implements VoidF0 {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$1(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static VoidF0 lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$1(chatFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF0
    @LambdaForm.Hidden
    public void f() {
        this.arg$1.lambda$new$0();
    }
}
