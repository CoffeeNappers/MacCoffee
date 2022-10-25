package com.vkontakte.android.fragments.messages;

import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$7 implements Consumer {
    private static final ChatFragment$$Lambda$7 instance = new ChatFragment$$Lambda$7();

    private ChatFragment$$Lambda$7() {
    }

    public static Consumer lambdaFactory$() {
        return instance;
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        ChatFragment.lambda$setDialogIcon$5((Throwable) obj);
    }
}
