package com.vkontakte.android.fragments;

import android.app.ProgressDialog;
import android.content.Context;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SettingsDebugFragment$$Lambda$18 implements Runnable {
    private final SettingsDebugFragment arg$1;
    private final Context arg$2;
    private final ProgressDialog arg$3;

    private SettingsDebugFragment$$Lambda$18(SettingsDebugFragment settingsDebugFragment, Context context, ProgressDialog progressDialog) {
        this.arg$1 = settingsDebugFragment;
        this.arg$2 = context;
        this.arg$3 = progressDialog;
    }

    public static Runnable lambdaFactory$(SettingsDebugFragment settingsDebugFragment, Context context, ProgressDialog progressDialog) {
        return new SettingsDebugFragment$$Lambda$18(settingsDebugFragment, context, progressDialog);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$downloadMessages$19(this.arg$2, this.arg$3);
    }
}
