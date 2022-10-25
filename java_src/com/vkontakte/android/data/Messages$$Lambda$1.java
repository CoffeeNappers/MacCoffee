package com.vkontakte.android.data;

import com.vkontakte.android.Message;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class Messages$$Lambda$1 implements Runnable {
    private final Message arg$1;

    private Messages$$Lambda$1(Message message) {
        this.arg$1 = message;
    }

    public static Runnable lambdaFactory$(Message message) {
        return new Messages$$Lambda$1(message);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Messages.lambda$add$0(this.arg$1);
    }
}
