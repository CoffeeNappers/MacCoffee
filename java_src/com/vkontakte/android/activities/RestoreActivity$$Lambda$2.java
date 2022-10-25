package com.vkontakte.android.activities;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RestoreActivity$$Lambda$2 implements Runnable {
    private final RestoreActivity arg$1;

    private RestoreActivity$$Lambda$2(RestoreActivity restoreActivity) {
        this.arg$1 = restoreActivity;
    }

    public static Runnable lambdaFactory$(RestoreActivity restoreActivity) {
        return new RestoreActivity$$Lambda$2(restoreActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onCreate$0();
    }
}
