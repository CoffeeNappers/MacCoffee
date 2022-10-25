package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class AuthCheckFragment$$Lambda$1 implements Runnable {
    private final AuthCheckFragment arg$1;
    private final String arg$2;

    private AuthCheckFragment$$Lambda$1(AuthCheckFragment authCheckFragment, String str) {
        this.arg$1 = authCheckFragment;
        this.arg$2 = str;
    }

    public static Runnable lambdaFactory$(AuthCheckFragment authCheckFragment, String str) {
        return new AuthCheckFragment$$Lambda$1(authCheckFragment, str);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$processSms$1(this.arg$2);
    }
}
