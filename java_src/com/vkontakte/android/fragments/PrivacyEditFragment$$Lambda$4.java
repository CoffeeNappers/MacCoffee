package com.vkontakte.android.fragments;

import com.vkontakte.android.functions.VoidF0;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PrivacyEditFragment$$Lambda$4 implements VoidF0 {
    private final PrivacyEditFragment arg$1;

    private PrivacyEditFragment$$Lambda$4(PrivacyEditFragment privacyEditFragment) {
        this.arg$1 = privacyEditFragment;
    }

    public static VoidF0 lambdaFactory$(PrivacyEditFragment privacyEditFragment) {
        return new PrivacyEditFragment$$Lambda$4(privacyEditFragment);
    }

    @Override // com.vkontakte.android.functions.VoidF0
    @LambdaForm.Hidden
    public void f() {
        this.arg$1.lambda$beforeSetAdapter$3();
    }
}
