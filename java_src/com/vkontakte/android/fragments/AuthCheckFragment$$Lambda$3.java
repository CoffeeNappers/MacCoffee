package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class AuthCheckFragment$$Lambda$3 implements Runnable {
    private final AuthCheckFragment arg$1;
    private final String arg$2;

    private AuthCheckFragment$$Lambda$3(AuthCheckFragment authCheckFragment, String str) {
        this.arg$1 = authCheckFragment;
        this.arg$2 = str;
    }

    public static Runnable lambdaFactory$(AuthCheckFragment authCheckFragment, String str) {
        return new AuthCheckFragment$$Lambda$3(authCheckFragment, str);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0(this.arg$2);
    }
}
