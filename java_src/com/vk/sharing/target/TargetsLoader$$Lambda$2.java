package com.vk.sharing.target;

import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class TargetsLoader$$Lambda$2 implements Runnable {
    private final TargetsLoader arg$1;
    private final ArrayList arg$2;

    private TargetsLoader$$Lambda$2(TargetsLoader targetsLoader, ArrayList arrayList) {
        this.arg$1 = targetsLoader;
        this.arg$2 = arrayList;
    }

    public static Runnable lambdaFactory$(TargetsLoader targetsLoader, ArrayList arrayList) {
        return new TargetsLoader$$Lambda$2(targetsLoader, arrayList);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0(this.arg$2);
    }
}
