package com.vkontakte.android.fragments.messages;

import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatFragment$$Lambda$25 implements Runnable {
    private final ChatFragment arg$1;
    private final ArrayList arg$2;

    private ChatFragment$$Lambda$25(ChatFragment chatFragment, ArrayList arrayList) {
        this.arg$1 = chatFragment;
        this.arg$2 = arrayList;
    }

    public static Runnable lambdaFactory$(ChatFragment chatFragment, ArrayList arrayList) {
        return new ChatFragment$$Lambda$25(chatFragment, arrayList);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$23(this.arg$2);
    }
}
