package com.vkontakte.android;

import com.vkontakte.android.ChangePasswordActivity;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ChangePasswordActivity$2$$Lambda$2 implements Runnable {
    private final ChangePasswordActivity.AnonymousClass2 arg$1;

    private ChangePasswordActivity$2$$Lambda$2(ChangePasswordActivity.AnonymousClass2 anonymousClass2) {
        this.arg$1 = anonymousClass2;
    }

    public static Runnable lambdaFactory$(ChangePasswordActivity.AnonymousClass2 anonymousClass2) {
        return new ChangePasswordActivity$2$$Lambda$2(anonymousClass2);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$fail$1();
    }
}
