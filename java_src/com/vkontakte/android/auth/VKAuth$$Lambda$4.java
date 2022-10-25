package com.vkontakte.android.auth;

import com.vkontakte.android.auth.VKAuth;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class VKAuth$$Lambda$4 implements Runnable {
    private final VKAuth.AuthListener arg$1;
    private final VKAuth.AuthResult arg$2;

    private VKAuth$$Lambda$4(VKAuth.AuthListener authListener, VKAuth.AuthResult authResult) {
        this.arg$1 = authListener;
        this.arg$2 = authResult;
    }

    public static Runnable lambdaFactory$(VKAuth.AuthListener authListener, VKAuth.AuthResult authResult) {
        return new VKAuth$$Lambda$4(authListener, authResult);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        VKAuth.lambda$null$0(this.arg$1, this.arg$2);
    }
}
