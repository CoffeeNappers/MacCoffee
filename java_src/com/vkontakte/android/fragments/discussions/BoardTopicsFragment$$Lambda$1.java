package com.vkontakte.android.fragments.discussions;

import android.content.DialogInterface;
import android.widget.EditText;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicsFragment$$Lambda$1 implements DialogInterface.OnClickListener {
    private final BoardTopicsFragment arg$1;
    private final EditText arg$2;

    private BoardTopicsFragment$$Lambda$1(BoardTopicsFragment boardTopicsFragment, EditText editText) {
        this.arg$1 = boardTopicsFragment;
        this.arg$2 = editText;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(BoardTopicsFragment boardTopicsFragment, EditText editText) {
        return new BoardTopicsFragment$$Lambda$1(boardTopicsFragment, editText);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showCreateBox$0(this.arg$2, dialogInterface, i);
    }
}
