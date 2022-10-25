package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.functions.VoidF2;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChatFragment$$Lambda$16 implements VoidF2 {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$16(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static VoidF2 lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$16(chatFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF2
    @LambdaForm.Hidden
    public void f(Object obj, Object obj2) {
        this.arg$1.lambda$onOptionsItemSelected$16((Integer) obj, obj2);
    }
}
