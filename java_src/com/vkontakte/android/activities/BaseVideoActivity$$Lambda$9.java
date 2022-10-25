package com.vkontakte.android.activities;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class BaseVideoActivity$$Lambda$9 implements Runnable {
    private final BaseVideoActivity arg$1;

    private BaseVideoActivity$$Lambda$9(BaseVideoActivity baseVideoActivity) {
        this.arg$1 = baseVideoActivity;
    }

    public static Runnable lambdaFactory$(BaseVideoActivity baseVideoActivity) {
        return new BaseVideoActivity$$Lambda$9(baseVideoActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$7();
    }
}
