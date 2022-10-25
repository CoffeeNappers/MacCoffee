package com.vkontakte.android.auth;

import com.vkontakte.android.auth.VKAuth;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class VKAuth$$Lambda$6 implements Runnable {
    private final VKAuth.AuthListener arg$1;
    private final VKAuth.AuthResult arg$2;

    private VKAuth$$Lambda$6(VKAuth.AuthListener authListener, VKAuth.AuthResult authResult) {
        this.arg$1 = authListener;
        this.arg$2 = authResult;
    }

    public static Runnable lambdaFactory$(VKAuth.AuthListener authListener, VKAuth.AuthResult authResult) {
        return new VKAuth$$Lambda$6(authListener, authResult);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onAuthFinish(r1.code, this.arg$2.authAnswer);
    }
}
