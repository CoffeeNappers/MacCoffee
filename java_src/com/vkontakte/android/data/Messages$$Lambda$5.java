package com.vkontakte.android.data;

import com.vkontakte.android.data.Messages;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class Messages$$Lambda$5 implements Runnable {
    private final int arg$1;
    private final int arg$2;
    private final int arg$3;
    private final int arg$4;
    private final Messages.GetMessagesCallback arg$5;

    private Messages$$Lambda$5(int i, int i2, int i3, int i4, Messages.GetMessagesCallback getMessagesCallback) {
        this.arg$1 = i;
        this.arg$2 = i2;
        this.arg$3 = i3;
        this.arg$4 = i4;
        this.arg$5 = getMessagesCallback;
    }

    public static Runnable lambdaFactory$(int i, int i2, int i3, int i4, Messages.GetMessagesCallback getMessagesCallback) {
        return new Messages$$Lambda$5(i, i2, i3, i4, getMessagesCallback);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Messages.lambda$getHistory$5(this.arg$1, this.arg$2, this.arg$3, this.arg$4, this.arg$5);
    }
}
