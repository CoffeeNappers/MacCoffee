package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.fragments.messages.ChatFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChatFragment$17$$Lambda$2 implements Runnable {
    private final ChatFragment.AnonymousClass17 arg$1;
    private final int arg$2;
    private final String arg$3;

    private ChatFragment$17$$Lambda$2(ChatFragment.AnonymousClass17 anonymousClass17, int i, String str) {
        this.arg$1 = anonymousClass17;
        this.arg$2 = i;
        this.arg$3 = str;
    }

    public static Runnable lambdaFactory$(ChatFragment.AnonymousClass17 anonymousClass17, int i, String str) {
        return new ChatFragment$17$$Lambda$2(anonymousClass17, i, str);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onError$1(this.arg$2, this.arg$3);
    }
}
