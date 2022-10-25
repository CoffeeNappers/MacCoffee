package com.vkontakte.android.fragments.money;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class CreateTransferFragment$$Lambda$3 implements Runnable {
    private final CreateTransferFragment arg$1;

    private CreateTransferFragment$$Lambda$3(CreateTransferFragment createTransferFragment) {
        this.arg$1 = createTransferFragment;
    }

    public static Runnable lambdaFactory$(CreateTransferFragment createTransferFragment) {
        return new CreateTransferFragment$$Lambda$3(createTransferFragment);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$delayScrollToBottom$2();
    }
}
