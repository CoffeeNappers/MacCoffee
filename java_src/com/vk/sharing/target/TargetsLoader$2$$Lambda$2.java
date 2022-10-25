package com.vk.sharing.target;

import com.vk.sharing.target.TargetsLoader;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class TargetsLoader$2$$Lambda$2 implements Runnable {
    private final TargetsLoader.AnonymousClass2 arg$1;

    private TargetsLoader$2$$Lambda$2(TargetsLoader.AnonymousClass2 anonymousClass2) {
        this.arg$1 = anonymousClass2;
    }

    public static Runnable lambdaFactory$(TargetsLoader.AnonymousClass2 anonymousClass2) {
        return new TargetsLoader$2$$Lambda$2(anonymousClass2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onError$1();
    }
}
