package com.vkontakte.android.ui;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WriteBar$$Lambda$6 implements Runnable {
    private final WriteBar arg$1;

    private WriteBar$$Lambda$6(WriteBar writeBar) {
        this.arg$1 = writeBar;
    }

    public static Runnable lambdaFactory$(WriteBar writeBar) {
        return new WriteBar$$Lambda$6(writeBar);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$hideVoiceRecordControl$5();
    }
}
