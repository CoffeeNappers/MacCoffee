package com.vkontakte.android.fragments.discussions;

import com.vkontakte.android.attachments.GraffitiAttachment;
import com.vkontakte.android.ui.WriteBar;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicViewFragment$$Lambda$2 implements WriteBar.GraffitiSender {
    private final BoardTopicViewFragment arg$1;

    private BoardTopicViewFragment$$Lambda$2(BoardTopicViewFragment boardTopicViewFragment) {
        this.arg$1 = boardTopicViewFragment;
    }

    public static WriteBar.GraffitiSender lambdaFactory$(BoardTopicViewFragment boardTopicViewFragment) {
        return new BoardTopicViewFragment$$Lambda$2(boardTopicViewFragment);
    }

    @Override // com.vkontakte.android.ui.WriteBar.GraffitiSender
    @LambdaForm.Hidden
    public void sendGraffiti(GraffitiAttachment graffitiAttachment) {
        this.arg$1.lambda$onCreateContentView$1(graffitiAttachment);
    }
}
