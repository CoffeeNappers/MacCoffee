package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChatFragment$$Lambda$17 implements VoidF1 {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$17(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static VoidF1 lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$17(chatFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$onOptionsItemSelected$17((Integer) obj);
    }
}
