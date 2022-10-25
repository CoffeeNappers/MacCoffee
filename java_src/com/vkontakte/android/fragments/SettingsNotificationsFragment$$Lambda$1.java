package com.vkontakte.android.fragments;

import android.support.v7.preference.Preference;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsNotificationsFragment$$Lambda$1 implements Preference.OnPreferenceChangeListener {
    private final SettingsNotificationsFragment arg$1;

    private SettingsNotificationsFragment$$Lambda$1(SettingsNotificationsFragment settingsNotificationsFragment) {
        this.arg$1 = settingsNotificationsFragment;
    }

    public static Preference.OnPreferenceChangeListener lambdaFactory$(SettingsNotificationsFragment settingsNotificationsFragment) {
        return new SettingsNotificationsFragment$$Lambda$1(settingsNotificationsFragment);
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceChangeListener
    @LambdaForm.Hidden
    public boolean onPreferenceChange(Preference preference, Object obj) {
        return this.arg$1.lambda$onCreate$0(preference, obj);
    }
}
