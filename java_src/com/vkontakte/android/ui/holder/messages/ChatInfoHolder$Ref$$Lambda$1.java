package com.vkontakte.android.ui.holder.messages;

import com.vkontakte.android.ui.holder.messages.ChatInfoHolder;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class ChatInfoHolder$Ref$$Lambda$1 implements Runnable {
    private final ChatInfoHolder arg$1;
    private final String arg$2;

    private ChatInfoHolder$Ref$$Lambda$1(ChatInfoHolder chatInfoHolder, String str) {
        this.arg$1 = chatInfoHolder;
        this.arg$2 = str;
    }

    public static Runnable lambdaFactory$(ChatInfoHolder chatInfoHolder, String str) {
        return new ChatInfoHolder$Ref$$Lambda$1(chatInfoHolder, str);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        ChatInfoHolder.Ref.lambda$setPhoto$0(this.arg$1, this.arg$2);
    }
}
