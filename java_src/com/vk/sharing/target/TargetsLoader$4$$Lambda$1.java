package com.vk.sharing.target;

import com.vk.sharing.target.TargetsLoader;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class TargetsLoader$4$$Lambda$1 implements Runnable {
    private final TargetsLoader.AnonymousClass4 arg$1;
    private final ArrayList arg$2;

    private TargetsLoader$4$$Lambda$1(TargetsLoader.AnonymousClass4 anonymousClass4, ArrayList arrayList) {
        this.arg$1 = anonymousClass4;
        this.arg$2 = arrayList;
    }

    public static Runnable lambdaFactory$(TargetsLoader.AnonymousClass4 anonymousClass4, ArrayList arrayList) {
        return new TargetsLoader$4$$Lambda$1(anonymousClass4, arrayList);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onResult$0(this.arg$2);
    }
}
