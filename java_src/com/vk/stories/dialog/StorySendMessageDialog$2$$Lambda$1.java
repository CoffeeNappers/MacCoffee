package com.vk.stories.dialog;

import com.vk.stories.dialog.StorySendMessageDialog;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StorySendMessageDialog$2$$Lambda$1 implements Runnable {
    private final StorySendMessageDialog.AnonymousClass2 arg$1;

    private StorySendMessageDialog$2$$Lambda$1(StorySendMessageDialog.AnonymousClass2 anonymousClass2) {
        this.arg$1 = anonymousClass2;
    }

    public static Runnable lambdaFactory$(StorySendMessageDialog.AnonymousClass2 anonymousClass2) {
        return new StorySendMessageDialog$2$$Lambda$1(anonymousClass2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onPreDraw$0();
    }
}
