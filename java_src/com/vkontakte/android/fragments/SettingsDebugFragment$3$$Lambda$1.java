package com.vkontakte.android.fragments;

import android.app.ProgressDialog;
import com.vkontakte.android.fragments.SettingsDebugFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class SettingsDebugFragment$3$$Lambda$1 implements Runnable {
    private final ProgressDialog arg$1;
    private final int[] arg$2;
    private final int[] arg$3;

    private SettingsDebugFragment$3$$Lambda$1(ProgressDialog progressDialog, int[] iArr, int[] iArr2) {
        this.arg$1 = progressDialog;
        this.arg$2 = iArr;
        this.arg$3 = iArr2;
    }

    public static Runnable lambdaFactory$(ProgressDialog progressDialog, int[] iArr, int[] iArr2) {
        return new SettingsDebugFragment$3$$Lambda$1(progressDialog, iArr, iArr2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        SettingsDebugFragment.AnonymousClass3.lambda$success$0(this.arg$1, this.arg$2, this.arg$3);
    }
}
