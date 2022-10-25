package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import com.vkontakte.android.fragments.ProfileFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ProfileFragment$12$$Lambda$1 implements DialogInterface.OnClickListener {
    private final ProfileFragment.AnonymousClass12 arg$1;

    private ProfileFragment$12$$Lambda$1(ProfileFragment.AnonymousClass12 anonymousClass12) {
        this.arg$1 = anonymousClass12;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(ProfileFragment.AnonymousClass12 anonymousClass12) {
        return new ProfileFragment$12$$Lambda$1(anonymousClass12);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$success$0(dialogInterface, i);
    }
}
