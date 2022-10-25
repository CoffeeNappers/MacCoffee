package com.vkontakte.android.activities;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class RestoreActivity$$Lambda$3 implements Runnable {
    private final RestoreActivity arg$1;

    private RestoreActivity$$Lambda$3(RestoreActivity restoreActivity) {
        this.arg$1 = restoreActivity;
    }

    public static Runnable lambdaFactory$(RestoreActivity restoreActivity) {
        return new RestoreActivity$$Lambda$3(restoreActivity);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$onPhoneDone$1();
    }
}
