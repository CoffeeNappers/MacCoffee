package com.vk.sharing.target;

import com.vk.sharing.target.TargetsLoader;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TargetsLoader$3$1$$Lambda$2 implements Runnable {
    private final TargetsLoader.AnonymousClass3.AnonymousClass1 arg$1;

    private TargetsLoader$3$1$$Lambda$2(TargetsLoader.AnonymousClass3.AnonymousClass1 anonymousClass1) {
        this.arg$1 = anonymousClass1;
    }

    public static Runnable lambdaFactory$(TargetsLoader.AnonymousClass3.AnonymousClass1 anonymousClass1) {
        return new TargetsLoader$3$1$$Lambda$2(anonymousClass1);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onError$1();
    }
}