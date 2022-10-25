package com.vkontakte.android.fragments;

import android.app.ProgressDialog;
import com.vkontakte.android.fragments.SettingsListFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsListFragment$3$$Lambda$1 implements Runnable {
    private final SettingsListFragment.AnonymousClass3 arg$1;
    private final ProgressDialog arg$2;

    private SettingsListFragment$3$$Lambda$1(SettingsListFragment.AnonymousClass3 anonymousClass3, ProgressDialog progressDialog) {
        this.arg$1 = anonymousClass3;
        this.arg$2 = progressDialog;
    }

    public static Runnable lambdaFactory$(SettingsListFragment.AnonymousClass3 anonymousClass3, ProgressDialog progressDialog) {
        return new SettingsListFragment$3$$Lambda$1(anonymousClass3, progressDialog);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$run$0(this.arg$2);
    }
}
