package com.vk.attachpicker;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GraffitiConfirmDialog$$Lambda$2 implements View.OnClickListener {
    private final GraffitiConfirmDialog arg$1;

    private GraffitiConfirmDialog$$Lambda$2(GraffitiConfirmDialog graffitiConfirmDialog) {
        this.arg$1 = graffitiConfirmDialog;
    }

    public static View.OnClickListener lambdaFactory$(GraffitiConfirmDialog graffitiConfirmDialog) {
        return new GraffitiConfirmDialog$$Lambda$2(graffitiConfirmDialog);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$new$1(view);
    }
}
