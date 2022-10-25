package com.vk.sharing.target;

import com.vk.sharing.target.TargetsLoader;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class TargetsLoader$2$$Lambda$1 implements Runnable {
    private final TargetsLoader.AnonymousClass2 arg$1;
    private final ArrayList arg$2;

    private TargetsLoader$2$$Lambda$1(TargetsLoader.AnonymousClass2 anonymousClass2, ArrayList arrayList) {
        this.arg$1 = anonymousClass2;
        this.arg$2 = arrayList;
    }

    public static Runnable lambdaFactory$(TargetsLoader.AnonymousClass2 anonymousClass2, ArrayList arrayList) {
        return new TargetsLoader$2$$Lambda$1(anonymousClass2, arrayList);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onResult$0(this.arg$2);
    }
}
