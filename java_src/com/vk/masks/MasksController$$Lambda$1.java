package com.vk.masks;

import io.reactivex.disposables.Disposable;
import io.reactivex.functions.Consumer;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class MasksController$$Lambda$1 implements Consumer {
    private final MasksController arg$1;

    private MasksController$$Lambda$1(MasksController masksController) {
        this.arg$1 = masksController;
    }

    public static Consumer lambdaFactory$(MasksController masksController) {
        return new MasksController$$Lambda$1(masksController);
    }

    @Override // io.reactivex.functions.Consumer
    @LambdaForm.Hidden
    public void accept(Object obj) {
        MasksController.access$lambda$0(this.arg$1, (Disposable) obj);
    }
}
