package com.vkontakte.android.fragments.news;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class PollEditorFragment$$Lambda$2 implements DialogInterface.OnClickListener {
    private final PollEditorFragment arg$1;

    private PollEditorFragment$$Lambda$2(PollEditorFragment pollEditorFragment) {
        this.arg$1 = pollEditorFragment;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(PollEditorFragment pollEditorFragment) {
        return new PollEditorFragment$$Lambda$2(pollEditorFragment);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onBackPressed$1(dialogInterface, i);
    }
}
