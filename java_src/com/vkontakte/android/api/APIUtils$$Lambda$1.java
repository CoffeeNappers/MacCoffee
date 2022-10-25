package com.vkontakte.android.api;

import android.content.Context;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class APIUtils$$Lambda$1 implements Runnable {
    private final Context arg$1;
    private final String arg$2;

    private APIUtils$$Lambda$1(Context context, String str) {
        this.arg$1 = context;
        this.arg$2 = str;
    }

    public static Runnable lambdaFactory$(Context context, String str) {
        return new APIUtils$$Lambda$1(context, str);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        APIUtils.lambda$showErrorToast$0(this.arg$1, this.arg$2);
    }
}
