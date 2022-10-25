package com.vkontakte.android.ui;

import com.vkontakte.android.ui.WriteBar;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class WriteBar$OnRecordTouchListener$$Lambda$1 implements Runnable {
    private final WriteBar.OnRecordTouchListener arg$1;

    private WriteBar$OnRecordTouchListener$$Lambda$1(WriteBar.OnRecordTouchListener onRecordTouchListener) {
        this.arg$1 = onRecordTouchListener;
    }

    public static Runnable lambdaFactory$(WriteBar.OnRecordTouchListener onRecordTouchListener) {
        return new WriteBar$OnRecordTouchListener$$Lambda$1(onRecordTouchListener);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onTouch$0();
    }
}
