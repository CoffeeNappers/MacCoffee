package com.vkontakte.android.ui;

import com.vkontakte.android.attachments.PendingVideoAttachment;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AttachmentsEditorView$$Lambda$8 implements Runnable {
    private final AttachmentsEditorView arg$1;
    private final PendingVideoAttachment arg$2;

    private AttachmentsEditorView$$Lambda$8(AttachmentsEditorView attachmentsEditorView, PendingVideoAttachment pendingVideoAttachment) {
        this.arg$1 = attachmentsEditorView;
        this.arg$2 = pendingVideoAttachment;
    }

    public static Runnable lambdaFactory$(AttachmentsEditorView attachmentsEditorView, PendingVideoAttachment pendingVideoAttachment) {
        return new AttachmentsEditorView$$Lambda$8(attachmentsEditorView, pendingVideoAttachment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$retryUploadVideo$3(this.arg$2);
    }
}
