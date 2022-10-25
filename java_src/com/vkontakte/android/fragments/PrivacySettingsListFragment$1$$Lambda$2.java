package com.vkontakte.android.fragments;

import com.vkontakte.android.fragments.PrivacySettingsListFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class PrivacySettingsListFragment$1$$Lambda$2 implements Runnable {
    private final PrivacySettingsListFragment.AnonymousClass1 arg$1;
    private final ArrayList arg$2;

    private PrivacySettingsListFragment$1$$Lambda$2(PrivacySettingsListFragment.AnonymousClass1 anonymousClass1, ArrayList arrayList) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = arrayList;
    }

    public static Runnable lambdaFactory$(PrivacySettingsListFragment.AnonymousClass1 anonymousClass1, ArrayList arrayList) {
        return new PrivacySettingsListFragment$1$$Lambda$2(anonymousClass1, arrayList);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0(this.arg$2);
    }
}
