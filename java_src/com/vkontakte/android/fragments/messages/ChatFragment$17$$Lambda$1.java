package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.fragments.messages.ChatFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class ChatFragment$17$$Lambda$1 implements Runnable {
    private final ChatFragment.AnonymousClass17 arg$1;
    private final ArrayList arg$2;

    private ChatFragment$17$$Lambda$1(ChatFragment.AnonymousClass17 anonymousClass17, ArrayList arrayList) {
        this.arg$1 = anonymousClass17;
        this.arg$2 = arrayList;
    }

    public static Runnable lambdaFactory$(ChatFragment.AnonymousClass17 anonymousClass17, ArrayList arrayList) {
        return new ChatFragment$17$$Lambda$1(anonymousClass17, arrayList);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onMessagesLoaded$0(this.arg$2);
    }
}
