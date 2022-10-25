package com.vkontakte.android.fragments;

import android.support.v7.preference.Preference;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsDebugFragment$$Lambda$16 implements Preference.OnPreferenceChangeListener {
    private final SettingsDebugFragment arg$1;

    private SettingsDebugFragment$$Lambda$16(SettingsDebugFragment settingsDebugFragment) {
        this.arg$1 = settingsDebugFragment;
    }

    public static Preference.OnPreferenceChangeListener lambdaFactory$(SettingsDebugFragment settingsDebugFragment) {
        return new SettingsDebugFragment$$Lambda$16(settingsDebugFragment);
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceChangeListener
    @LambdaForm.Hidden
    public boolean onPreferenceChange(Preference preference, Object obj) {
        return this.arg$1.lambda$onCreate$17(preference, obj);
    }
}
