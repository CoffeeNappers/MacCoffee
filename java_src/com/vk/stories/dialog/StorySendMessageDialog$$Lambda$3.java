package com.vk.stories.dialog;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StorySendMessageDialog$$Lambda$3 implements Runnable {
    private final StorySendMessageDialog arg$1;

    private StorySendMessageDialog$$Lambda$3(StorySendMessageDialog storySendMessageDialog) {
        this.arg$1 = storySendMessageDialog;
    }

    public static Runnable lambdaFactory$(StorySendMessageDialog storySendMessageDialog) {
        return new StorySendMessageDialog$$Lambda$3(storySendMessageDialog);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$openKeyboard$2();
    }
}
