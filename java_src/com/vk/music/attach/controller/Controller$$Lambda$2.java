package com.vk.music.attach.controller;

import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Controller$$Lambda$2 implements View.OnClickListener {
    private final Controller arg$1;

    private Controller$$Lambda$2(Controller controller) {
        this.arg$1 = controller;
    }

    public static View.OnClickListener lambdaFactory$(Controller controller) {
        return new Controller$$Lambda$2(controller);
    }

    @Override // android.view.View.OnClickListener
    @LambdaForm.Hidden
    public void onClick(View view) {
        this.arg$1.lambda$onResume$1(view);
    }
}
