package com.vkontakte.android.auth;

import com.vkontakte.android.auth.VKAuth;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class VKAuth$$Lambda$1 implements Runnable {
    private final VKAuth.AuthListener arg$1;

    private VKAuth$$Lambda$1(VKAuth.AuthListener authListener) {
        this.arg$1 = authListener;
    }

    public static Runnable lambdaFactory$(VKAuth.AuthListener authListener) {
        return new VKAuth$$Lambda$1(authListener);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.onAuthStart();
    }
}
