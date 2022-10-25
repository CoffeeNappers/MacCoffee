package com.vkontakte.android.ui;

import com.vkontakte.android.ui.WriteBar;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WriteBar$1$$Lambda$1 implements Runnable {
    private final WriteBar.AnonymousClass1 arg$1;

    private WriteBar$1$$Lambda$1(WriteBar.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static Runnable lambdaFactory$(WriteBar.AnonymousClass1 anonymousClass1) {
        return new WriteBar$1$$Lambda$1(anonymousClass1);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onReceive$0();
    }
}
