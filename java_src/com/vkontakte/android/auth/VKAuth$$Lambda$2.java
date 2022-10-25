package com.vkontakte.android.auth;

import com.vkontakte.android.auth.VKAuth;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class VKAuth$$Lambda$2 implements Runnable {
    private final VKAuthState arg$1;
    private final VKAuth.AuthListener arg$2;

    private VKAuth$$Lambda$2(VKAuthState vKAuthState, VKAuth.AuthListener authListener) {
        this.arg$1 = vKAuthState;
        this.arg$2 = authListener;
    }

    public static Runnable lambdaFactory$(VKAuthState vKAuthState, VKAuth.AuthListener authListener) {
        return new VKAuth$$Lambda$2(vKAuthState, authListener);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        VKAuth.lambda$authAsync$3(this.arg$1, this.arg$2);
    }
}
