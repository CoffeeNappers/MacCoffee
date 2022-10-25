package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import com.vkontakte.android.fragments.ProfileFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$12$$Lambda$2 implements DialogInterface.OnCancelListener {
    private final ProfileFragment.AnonymousClass12 arg$1;

    private ProfileFragment$12$$Lambda$2(ProfileFragment.AnonymousClass12 anonymousClass12) {
        this.arg$1 = anonymousClass12;
    }

    public static DialogInterface.OnCancelListener lambdaFactory$(ProfileFragment.AnonymousClass12 anonymousClass12) {
        return new ProfileFragment$12$$Lambda$2(anonymousClass12);
    }

    @Override // android.content.DialogInterface.OnCancelListener
    @LambdaForm.Hidden
    public void onCancel(DialogInterface dialogInterface) {
        this.arg$1.lambda$success$1(dialogInterface);
    }
}
