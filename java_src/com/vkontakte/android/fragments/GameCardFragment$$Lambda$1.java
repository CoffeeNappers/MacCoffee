package com.vkontakte.android.fragments;

import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.View;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class GameCardFragment$$Lambda$1 implements View.OnTouchListener {
    private final GestureDetector arg$1;

    private GameCardFragment$$Lambda$1(GestureDetector gestureDetector) {
        this.arg$1 = gestureDetector;
    }

    public static View.OnTouchListener lambdaFactory$(GestureDetector gestureDetector) {
        return new GameCardFragment$$Lambda$1(gestureDetector);
    }

    @Override // android.view.View.OnTouchListener
    @LambdaForm.Hidden
    public boolean onTouch(View view, MotionEvent motionEvent) {
        return GameCardFragment.lambda$onViewCreated$0(this.arg$1, view, motionEvent);
    }
}
