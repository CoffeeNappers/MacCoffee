package com.vk.sharing;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class DialogSearchPresenter$$Lambda$1 implements Runnable {
    private final DialogSearchPresenter arg$1;

    private DialogSearchPresenter$$Lambda$1(DialogSearchPresenter dialogSearchPresenter) {
        this.arg$1 = dialogSearchPresenter;
    }

    public static Runnable lambdaFactory$(DialogSearchPresenter dialogSearchPresenter) {
        return new DialogSearchPresenter$$Lambda$1(dialogSearchPresenter);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$new$0();
    }
}
