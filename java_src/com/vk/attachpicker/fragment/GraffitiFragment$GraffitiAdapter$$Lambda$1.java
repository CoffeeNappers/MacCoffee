package com.vk.attachpicker.fragment;

import com.vk.attachpicker.fragment.GraffitiFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GraffitiFragment$GraffitiAdapter$$Lambda$1 implements Runnable {
    private final GraffitiFragment.GraffitiAdapter arg$1;

    private GraffitiFragment$GraffitiAdapter$$Lambda$1(GraffitiFragment.GraffitiAdapter graffitiAdapter) {
        this.arg$1 = graffitiAdapter;
    }

    public static Runnable lambdaFactory$(GraffitiFragment.GraffitiAdapter graffitiAdapter) {
        return new GraffitiFragment$GraffitiAdapter$$Lambda$1(graffitiAdapter);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$removeGraffiti$0();
    }
}
