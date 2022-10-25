package com.vkontakte.android.fragments.discussions;

import android.content.DialogInterface;
import com.vkontakte.android.api.BoardTopic;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicsFragment$$Lambda$5 implements DialogInterface.OnClickListener {
    private final BoardTopicsFragment arg$1;
    private final BoardTopic arg$2;

    private BoardTopicsFragment$$Lambda$5(BoardTopicsFragment boardTopicsFragment, BoardTopic boardTopic) {
        this.arg$1 = boardTopicsFragment;
        this.arg$2 = boardTopic;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(BoardTopicsFragment boardTopicsFragment, BoardTopic boardTopic) {
        return new BoardTopicsFragment$$Lambda$5(boardTopicsFragment, boardTopic);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$confirmDeleteTopic$4(this.arg$2, dialogInterface, i);
    }
}
