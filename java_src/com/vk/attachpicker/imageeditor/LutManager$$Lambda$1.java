package com.vk.attachpicker.imageeditor;

import com.vk.attachpicker.imageeditor.json.ApiFilterWrapper;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class LutManager$$Lambda$1 implements Runnable {
    private final ApiFilterWrapper arg$1;

    private LutManager$$Lambda$1(ApiFilterWrapper apiFilterWrapper) {
        this.arg$1 = apiFilterWrapper;
    }

    public static Runnable lambdaFactory$(ApiFilterWrapper apiFilterWrapper) {
        return new LutManager$$Lambda$1(apiFilterWrapper);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        LutManager.lambda$populateBitmap$0(this.arg$1);
    }
}
