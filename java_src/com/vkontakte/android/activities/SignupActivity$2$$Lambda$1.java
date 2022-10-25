package com.vkontakte.android.activities;

import android.content.DialogInterface;
import com.vkontakte.android.activities.SignupActivity;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SignupActivity$2$$Lambda$1 implements DialogInterface.OnClickListener {
    private final SignupActivity.AnonymousClass2 arg$1;

    private SignupActivity$2$$Lambda$1(SignupActivity.AnonymousClass2 anonymousClass2) {
        this.arg$1 = anonymousClass2;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(SignupActivity.AnonymousClass2 anonymousClass2) {
        return new SignupActivity$2$$Lambda$1(anonymousClass2);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$fail$0(dialogInterface, i);
    }
}
