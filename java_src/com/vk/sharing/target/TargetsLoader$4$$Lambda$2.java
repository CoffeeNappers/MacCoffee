package com.vk.sharing.target;

import com.vk.sharing.target.TargetsLoader;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TargetsLoader$4$$Lambda$2 implements Runnable {
    private final TargetsLoader.AnonymousClass4 arg$1;

    private TargetsLoader$4$$Lambda$2(TargetsLoader.AnonymousClass4 anonymousClass4) {
        this.arg$1 = anonymousClass4;
    }

    public static Runnable lambdaFactory$(TargetsLoader.AnonymousClass4 anonymousClass4) {
        return new TargetsLoader$4$$Lambda$2(anonymousClass4);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onError$1();
    }
}
