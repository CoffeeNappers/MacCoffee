package com.vkontakte.android.fragments;

import com.vkontakte.android.data.Friends;
import com.vkontakte.android.fragments.PrivacySettingsListFragment;
import java.lang.invoke.LambdaForm;
import java.util.ArrayList;
/* loaded from: classes.dex */
final /* synthetic */ class PrivacySettingsListFragment$1$$Lambda$1 implements Friends.GetUsersCallback {
    private final PrivacySettingsListFragment.AnonymousClass1 arg$1;
    private final ArrayList arg$2;

    private PrivacySettingsListFragment$1$$Lambda$1(PrivacySettingsListFragment.AnonymousClass1 anonymousClass1, ArrayList arrayList) {
        this.arg$1 = anonymousClass1;
        this.arg$2 = arrayList;
    }

    public static Friends.GetUsersCallback lambdaFactory$(PrivacySettingsListFragment.AnonymousClass1 anonymousClass1, ArrayList arrayList) {
        return new PrivacySettingsListFragment$1$$Lambda$1(anonymousClass1, arrayList);
    }

    @Override // com.vkontakte.android.data.Friends.GetUsersCallback
    @LambdaForm.Hidden
    public void onUsersLoaded(ArrayList arrayList) {
        this.arg$1.lambda$success$1(this.arg$2, arrayList);
    }
}
