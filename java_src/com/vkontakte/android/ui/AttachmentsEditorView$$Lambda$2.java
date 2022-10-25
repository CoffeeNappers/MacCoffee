package com.vkontakte.android.ui;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AttachmentsEditorView$$Lambda$2 implements View.OnClickListener {
    private final AttachmentsEditorView arg$1;

    private AttachmentsEditorView$$Lambda$2(AttachmentsEditorView attachmentsEditorView) {
        this.arg$1 = attachmentsEditorView;
    }

    public static View.OnClickListener lambdaFactory$(AttachmentsEditorView attachmentsEditorView) {
        return new AttachmentsEditorView$$Lambda$2(attachmentsEditorView);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$1(view);
    }
}
