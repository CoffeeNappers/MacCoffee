package com.vkontakte.android.fragments;

import android.support.v7.preference.Preference;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsDebugFragment$$Lambda$4 implements Preference.OnPreferenceClickListener {
    private final SettingsDebugFragment arg$1;

    private SettingsDebugFragment$$Lambda$4(SettingsDebugFragment settingsDebugFragment) {
        this.arg$1 = settingsDebugFragment;
    }

    public static Preference.OnPreferenceClickListener lambdaFactory$(SettingsDebugFragment settingsDebugFragment) {
        return new SettingsDebugFragment$$Lambda$4(settingsDebugFragment);
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceClickListener
    @LambdaForm.Hidden
    public boolean onPreferenceClick(Preference preference) {
        return this.arg$1.lambda$onCreate$4(preference);
    }
}