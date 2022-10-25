package com.vkontakte.android.fragments;

import android.content.Context;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsDebugFragment$$Lambda$19 implements Runnable {
    private final Context arg$1;

    private SettingsDebugFragment$$Lambda$19(Context context) {
        this.arg$1 = context;
    }

    public static Runnable lambdaFactory$(Context context) {
        return new SettingsDebugFragment$$Lambda$19(context);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        SettingsDebugFragment.lambda$null$13(this.arg$1);
    }
}
