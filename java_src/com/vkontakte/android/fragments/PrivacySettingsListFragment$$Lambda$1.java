package com.vkontakte.android.fragments;

import java.lang.invoke.LambdaForm;
import me.grishka.appkit.views.DividerItemDecoration;
/* loaded from: classes.dex */
final /* synthetic */ class PrivacySettingsListFragment$$Lambda$1 implements DividerItemDecoration.Provider {
    private final PrivacySettingsListFragment arg$1;

    private PrivacySettingsListFragment$$Lambda$1(PrivacySettingsListFragment privacySettingsListFragment) {
        this.arg$1 = privacySettingsListFragment;
    }

    public static DividerItemDecoration.Provider lambdaFactory$(PrivacySettingsListFragment privacySettingsListFragment) {
        return new PrivacySettingsListFragment$$Lambda$1(privacySettingsListFragment);
    }

    @Override // me.grishka.appkit.views.DividerItemDecoration.Provider
    @LambdaForm.Hidden
    public boolean needDrawDividerAfter(int i) {
        return this.arg$1.lambda$onCreateContentView$0(i);
    }
}
