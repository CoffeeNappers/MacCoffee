package com.vkontakte.android.fragments;

import android.support.v7.preference.Preference;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsAccountInnerFragment$$Lambda$2 implements Preference.OnPreferenceClickListener {
    private final SettingsAccountInnerFragment arg$1;

    private SettingsAccountInnerFragment$$Lambda$2(SettingsAccountInnerFragment settingsAccountInnerFragment) {
        this.arg$1 = settingsAccountInnerFragment;
    }

    public static Preference.OnPreferenceClickListener lambdaFactory$(SettingsAccountInnerFragment settingsAccountInnerFragment) {
        return new SettingsAccountInnerFragment$$Lambda$2(settingsAccountInnerFragment);
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceClickListener
    @LambdaForm.Hidden
    public boolean onPreferenceClick(Preference preference) {
        return this.arg$1.lambda$onCreate$1(preference);
    }
}
