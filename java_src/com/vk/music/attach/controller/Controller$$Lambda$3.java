package com.vk.music.attach.controller;

import android.support.v4.widget.SwipeRefreshLayout;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Controller$$Lambda$3 implements SwipeRefreshLayout.OnRefreshListener {
    private final Controller arg$1;

    private Controller$$Lambda$3(Controller controller) {
        this.arg$1 = controller;
    }

    public static SwipeRefreshLayout.OnRefreshListener lambdaFactory$(Controller controller) {
        return new Controller$$Lambda$3(controller);
    }

    @Override // android.support.v4.widget.SwipeRefreshLayout.OnRefreshListener
    @LambdaForm.Hidden
    public void onRefresh() {
        this.arg$1.onRefreshRequested();
    }
}
