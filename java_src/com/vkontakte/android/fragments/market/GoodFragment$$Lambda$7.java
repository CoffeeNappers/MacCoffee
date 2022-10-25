package com.vkontakte.android.fragments.market;

import android.content.DialogInterface;
import com.vkontakte.android.api.board.BoardComment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GoodFragment$$Lambda$7 implements DialogInterface.OnClickListener {
    private final GoodFragment arg$1;
    private final BoardComment arg$2;

    private GoodFragment$$Lambda$7(GoodFragment goodFragment, BoardComment boardComment) {
        this.arg$1 = goodFragment;
        this.arg$2 = boardComment;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(GoodFragment goodFragment, BoardComment boardComment) {
        return new GoodFragment$$Lambda$7(goodFragment, boardComment);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showCommentActions$7(this.arg$2, dialogInterface, i);
    }
}
