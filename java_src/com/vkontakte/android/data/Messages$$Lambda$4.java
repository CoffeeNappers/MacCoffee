package com.vkontakte.android.data;

import com.vkontakte.android.data.Messages;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Messages$$Lambda$4 implements Runnable {
    private final Messages.GetUnreadCountCallback arg$1;
    private final int arg$2;

    private Messages$$Lambda$4(Messages.GetUnreadCountCallback getUnreadCountCallback, int i) {
        this.arg$1 = getUnreadCountCallback;
        this.arg$2 = i;
    }

    public static Runnable lambdaFactory$(Messages.GetUnreadCountCallback getUnreadCountCallback, int i) {
        return new Messages$$Lambda$4(getUnreadCountCallback, i);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Messages.lambda$getUnreadCount$4(this.arg$1, this.arg$2);
    }
}
