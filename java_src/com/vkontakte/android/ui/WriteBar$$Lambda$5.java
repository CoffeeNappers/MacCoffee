package com.vkontakte.android.ui;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WriteBar$$Lambda$5 implements View.OnClickListener {
    private final WriteBar arg$1;

    private WriteBar$$Lambda$5(WriteBar writeBar) {
        this.arg$1 = writeBar;
    }

    public static View.OnClickListener lambdaFactory$(WriteBar writeBar) {
        return new WriteBar$$Lambda$5(writeBar);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$init$4(view);
    }
}
