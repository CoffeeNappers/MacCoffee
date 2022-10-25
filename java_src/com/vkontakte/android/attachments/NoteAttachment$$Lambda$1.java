package com.vkontakte.android.attachments;

import android.content.Context;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NoteAttachment$$Lambda$1 implements View.OnClickListener {
    private final NoteAttachment arg$1;
    private final Context arg$2;

    private NoteAttachment$$Lambda$1(NoteAttachment noteAttachment, Context context) {
        this.arg$1 = noteAttachment;
        this.arg$2 = context;
    }

    public static View.OnClickListener lambdaFactory$(NoteAttachment noteAttachment, Context context) {
        return new NoteAttachment$$Lambda$1(noteAttachment, context);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$getViewForList$0(this.arg$2, view);
    }
}
