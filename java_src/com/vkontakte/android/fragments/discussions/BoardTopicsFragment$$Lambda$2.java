package com.vkontakte.android.fragments.discussions;

import android.content.DialogInterface;
import android.widget.EditText;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicsFragment$$Lambda$2 implements DialogInterface.OnShowListener {
    private final BoardTopicsFragment arg$1;
    private final EditText arg$2;

    private BoardTopicsFragment$$Lambda$2(BoardTopicsFragment boardTopicsFragment, EditText editText) {
        this.arg$1 = boardTopicsFragment;
        this.arg$2 = editText;
    }

    public static DialogInterface.OnShowListener lambdaFactory$(BoardTopicsFragment boardTopicsFragment, EditText editText) {
        return new BoardTopicsFragment$$Lambda$2(boardTopicsFragment, editText);
    }

    @Override // android.content.DialogInterface.OnShowListener
    @LambdaForm.Hidden
    public void onShow(DialogInterface dialogInterface) {
        this.arg$1.lambda$showCreateBox$1(this.arg$2, dialogInterface);
    }
}
