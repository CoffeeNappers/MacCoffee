package com.vkontakte.android.fragments;

import com.vkontakte.android.UserProfile;
import com.vkontakte.android.fragments.PrivacyEditFragment;
import com.vkontakte.android.functions.VoidF1;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class PrivacyEditFragment$UserListAdapter$$Lambda$1 implements VoidF1 {
    private final PrivacyEditFragment.UserListAdapter arg$1;

    private PrivacyEditFragment$UserListAdapter$$Lambda$1(PrivacyEditFragment.UserListAdapter userListAdapter) {
        this.arg$1 = userListAdapter;
    }

    public static VoidF1 lambdaFactory$(PrivacyEditFragment.UserListAdapter userListAdapter) {
        return new PrivacyEditFragment$UserListAdapter$$Lambda$1(userListAdapter);
    }

    @Override // com.vkontakte.android.functions.VoidF1
    @LambdaForm.Hidden
    public void f(Object obj) {
        this.arg$1.lambda$new$0((UserProfile) obj);
    }
}
