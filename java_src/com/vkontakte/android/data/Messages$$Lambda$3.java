package com.vkontakte.android.data;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Messages$$Lambda$3 implements Runnable {
    private final int arg$1;
    private final boolean arg$2;

    private Messages$$Lambda$3(int i, boolean z) {
        this.arg$1 = i;
        this.arg$2 = z;
    }

    public static Runnable lambdaFactory$(int i, boolean z) {
        return new Messages$$Lambda$3(i, z);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        Messages.lambda$setReadState$3(this.arg$1, this.arg$2);
    }
}
