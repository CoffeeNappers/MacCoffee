package com.vk.attachpicker;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AttachActivity$$Lambda$7 implements View.OnClickListener {
    private final AttachActivity arg$1;

    private AttachActivity$$Lambda$7(AttachActivity attachActivity) {
        this.arg$1 = attachActivity;
    }

    public static View.OnClickListener lambdaFactory$(AttachActivity attachActivity) {
        return new AttachActivity$$Lambda$7(attachActivity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$initViews$6(view);
    }
}
