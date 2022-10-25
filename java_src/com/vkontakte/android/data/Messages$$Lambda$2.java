package com.vkontakte.android.data;

import com.vkontakte.android.data.Messages;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Messages$$Lambda$2 implements Runnable {
    private final int arg$1;
    private final int arg$2;
    private final Messages.GetDialogsCallback arg$3;

    private Messages$$Lambda$2(int i, int i2, Messages.GetDialogsCallback getDialogsCallback) {
        this.arg$1 = i;
        this.arg$2 = i2;
        this.arg$3 = getDialogsCallback;
    }

    public static Runnable lambdaFactory$(int i, int i2, Messages.GetDialogsCallback getDialogsCallback) {
        return new Messages$$Lambda$2(i, i2, getDialogsCallback);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Messages.lambda$getDialogs$2(this.arg$1, this.arg$2, this.arg$3);
    }
}
