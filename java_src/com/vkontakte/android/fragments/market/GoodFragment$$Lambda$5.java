package com.vkontakte.android.fragments.market;

import android.app.ProgressDialog;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class GoodFragment$$Lambda$5 implements Runnable {
    private final GoodFragment arg$1;
    private final ProgressDialog arg$2;

    private GoodFragment$$Lambda$5(GoodFragment goodFragment, ProgressDialog progressDialog) {
        this.arg$1 = goodFragment;
        this.arg$2 = progressDialog;
    }

    public static Runnable lambdaFactory$(GoodFragment goodFragment, ProgressDialog progressDialog) {
        return new GoodFragment$$Lambda$5(goodFragment, progressDialog);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$waitAndSendComment$5(this.arg$2);
    }
}
