package com.vkontakte.android.activities;

import android.view.View;
import android.view.Window;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class BaseVideoActivity$$Lambda$8 implements View.OnSystemUiVisibilityChangeListener {
    private final BaseVideoActivity arg$1;
    private final Window arg$2;

    private BaseVideoActivity$$Lambda$8(BaseVideoActivity baseVideoActivity, Window window) {
        this.arg$1 = baseVideoActivity;
        this.arg$2 = window;
    }

    public static View.OnSystemUiVisibilityChangeListener lambdaFactory$(BaseVideoActivity baseVideoActivity, Window window) {
        return new BaseVideoActivity$$Lambda$8(baseVideoActivity, window);
    }

    @Override // android.view.View.OnSystemUiVisibilityChangeListener
    @LambdaForm.Hidden
    public void onSystemUiVisibilityChange(int i) {
        this.arg$1.lambda$initSystemView$8(this.arg$2, i);
    }
}
