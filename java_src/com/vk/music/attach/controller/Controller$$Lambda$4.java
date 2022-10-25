package com.vk.music.attach.controller;

import com.vk.music.view.LastReachedScrollListener;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class Controller$$Lambda$4 implements LastReachedScrollListener.OnLastReachedListener {
    private final Controller arg$1;

    private Controller$$Lambda$4(Controller controller) {
        this.arg$1 = controller;
    }

    public static LastReachedScrollListener.OnLastReachedListener lambdaFactory$(Controller controller) {
        return new Controller$$Lambda$4(controller);
    }

    @Override // com.vk.music.view.LastReachedScrollListener.OnLastReachedListener
    @LambdaForm.Hidden
    public void onLastReached() {
        this.arg$1.onEndOfListReached();
    }
}
