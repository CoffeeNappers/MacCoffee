package com.vkontakte.android.fragments.messages;

import com.vkontakte.android.attachments.GraffitiAttachment;
import com.vkontakte.android.ui.WriteBar;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChatFragment$$Lambda$11 implements WriteBar.GraffitiSender {
    private final ChatFragment arg$1;

    private ChatFragment$$Lambda$11(ChatFragment chatFragment) {
        this.arg$1 = chatFragment;
    }

    public static WriteBar.GraffitiSender lambdaFactory$(ChatFragment chatFragment) {
        return new ChatFragment$$Lambda$11(chatFragment);
    }

    @Override // com.vkontakte.android.ui.WriteBar.GraffitiSender
    @LambdaForm.Hidden
    public void sendGraffiti(GraffitiAttachment graffitiAttachment) {
        this.arg$1.lambda$onCreateContentView$9(graffitiAttachment);
    }
}
