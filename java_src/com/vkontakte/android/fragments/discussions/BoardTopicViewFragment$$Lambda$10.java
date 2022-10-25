package com.vkontakte.android.fragments.discussions;

import android.content.DialogInterface;
import com.vkontakte.android.api.board.BoardComment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicViewFragment$$Lambda$10 implements DialogInterface.OnClickListener {
    private final BoardTopicViewFragment arg$1;
    private final BoardComment arg$2;

    private BoardTopicViewFragment$$Lambda$10(BoardTopicViewFragment boardTopicViewFragment, BoardComment boardComment) {
        this.arg$1 = boardTopicViewFragment;
        this.arg$2 = boardComment;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(BoardTopicViewFragment boardTopicViewFragment, BoardComment boardComment) {
        return new BoardTopicViewFragment$$Lambda$10(boardTopicViewFragment, boardComment);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showCommentActions$10(this.arg$2, dialogInterface, i);
    }
}
