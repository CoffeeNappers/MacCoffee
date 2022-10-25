package com.vkontakte.android.fragments;

import android.graphics.Bitmap;
import com.vkontakte.android.fragments.SignupProfileFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupProfileFragment$4$$Lambda$1 implements Runnable {
    private final SignupProfileFragment.AnonymousClass4 arg$1;
    private final Bitmap arg$2;

    private SignupProfileFragment$4$$Lambda$1(SignupProfileFragment.AnonymousClass4 anonymousClass4, Bitmap bitmap) {
        this.arg$1 = anonymousClass4;
        this.arg$2 = bitmap;
    }

    public static Runnable lambdaFactory$(SignupProfileFragment.AnonymousClass4 anonymousClass4, Bitmap bitmap) {
        return new SignupProfileFragment$4$$Lambda$1(anonymousClass4, bitmap);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$run$0(this.arg$2);
    }
}
