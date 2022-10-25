package com.vk.sharing.target;

import com.vk.sharing.target.TargetsLoader;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TargetsLoader$3$$Lambda$1 implements Runnable {
    private final TargetsLoader.AnonymousClass3 arg$1;

    private TargetsLoader$3$$Lambda$1(TargetsLoader.AnonymousClass3 anonymousClass3) {
        this.arg$1 = anonymousClass3;
    }

    public static Runnable lambdaFactory$(TargetsLoader.AnonymousClass3 anonymousClass3) {
        return new TargetsLoader$3$$Lambda$1(anonymousClass3);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$fail$0();
    }
}
