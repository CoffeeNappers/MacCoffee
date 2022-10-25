package com.vkontakte.android.activities;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BaseVideoActivity$$Lambda$2 implements View.OnClickListener {
    private final BaseVideoActivity arg$1;

    private BaseVideoActivity$$Lambda$2(BaseVideoActivity baseVideoActivity) {
        this.arg$1 = baseVideoActivity;
    }

    public static View.OnClickListener lambdaFactory$(BaseVideoActivity baseVideoActivity) {
        return new BaseVideoActivity$$Lambda$2(baseVideoActivity);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onCreate$1(view);
    }
}
