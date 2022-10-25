package com.vkontakte.android.fragments;

import android.support.v7.preference.Preference;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsNotificationsFragment$$Lambda$2 implements Preference.OnPreferenceClickListener {
    private final SettingsNotificationsFragment arg$1;

    private SettingsNotificationsFragment$$Lambda$2(SettingsNotificationsFragment settingsNotificationsFragment) {
        this.arg$1 = settingsNotificationsFragment;
    }

    public static Preference.OnPreferenceClickListener lambdaFactory$(SettingsNotificationsFragment settingsNotificationsFragment) {
        return new SettingsNotificationsFragment$$Lambda$2(settingsNotificationsFragment);
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceClickListener
    @LambdaForm.Hidden
    public boolean onPreferenceClick(Preference preference) {
        return this.arg$1.lambda$onCreate$1(preference);
    }
}
