package com.vkontakte.android.fragments.messages;

import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes.dex */
final /* synthetic */ class ChatLinkAttachmentHistoryFragment$$Lambda$1 implements DividerItemDecoration.Provider {
    private final ChatLinkAttachmentHistoryFragment arg$1;

    private ChatLinkAttachmentHistoryFragment$$Lambda$1(ChatLinkAttachmentHistoryFragment chatLinkAttachmentHistoryFragment) {
        this.arg$1 = chatLinkAttachmentHistoryFragment;
    }

    public static DividerItemDecoration.Provider lambdaFactory$(ChatLinkAttachmentHistoryFragment chatLinkAttachmentHistoryFragment) {
        return new ChatLinkAttachmentHistoryFragment$$Lambda$1(chatLinkAttachmentHistoryFragment);
    }

    @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
    @LambdaForm.Hidden
    public boolean needDrawDividerAfter(int i) {
        return this.arg$1.lambda$onCreateContentView$0(i);
    }
}
