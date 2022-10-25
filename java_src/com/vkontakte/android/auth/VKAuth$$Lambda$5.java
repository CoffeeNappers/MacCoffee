package com.vkontakte.android.auth;

import com.vkontakte.android.auth.VKAuth;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class VKAuth$$Lambda$5 implements Runnable {
    private final VKAuth.AuthListener arg$1;
    private final VKAuthState arg$2;
    private final VKAuth.AuthResult arg$3;

    private VKAuth$$Lambda$5(VKAuth.AuthListener authListener, VKAuthState vKAuthState, VKAuth.AuthResult authResult) {
        this.arg$1 = authListener;
        this.arg$2 = vKAuthState;
        this.arg$3 = authResult;
    }

    public static Runnable lambdaFactory$(VKAuth.AuthListener authListener, VKAuthState vKAuthState, VKAuth.AuthResult authResult) {
        return new VKAuth$$Lambda$5(authListener, vKAuthState, authResult);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onAuthNeedValidation(this.arg$2, this.arg$3.authAnswer);
    }
}
