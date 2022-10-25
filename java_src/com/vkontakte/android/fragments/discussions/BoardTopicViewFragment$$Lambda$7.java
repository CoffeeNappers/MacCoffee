package com.vkontakte.android.fragments.discussions;

import android.content.DialogInterface;
import android.widget.EditText;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BoardTopicViewFragment$$Lambda$7 implements DialogInterface.OnClickListener {
    private final BoardTopicViewFragment arg$1;
    private final EditText arg$2;

    private BoardTopicViewFragment$$Lambda$7(BoardTopicViewFragment boardTopicViewFragment, EditText editText) {
        this.arg$1 = boardTopicViewFragment;
        this.arg$2 = editText;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(BoardTopicViewFragment boardTopicViewFragment, EditText editText) {
        return new BoardTopicViewFragment$$Lambda$7(boardTopicViewFragment, editText);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onPageSelected$7(this.arg$2, dialogInterface, i);
    }
}
