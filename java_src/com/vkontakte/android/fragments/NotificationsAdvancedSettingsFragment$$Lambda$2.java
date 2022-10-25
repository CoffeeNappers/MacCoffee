package com.vkontakte.android.fragments;

import android.support.v7.preference.Preference;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NotificationsAdvancedSettingsFragment$$Lambda$2 implements Preference.OnPreferenceChangeListener {
    private final NotificationsAdvancedSettingsFragment arg$1;

    private NotificationsAdvancedSettingsFragment$$Lambda$2(NotificationsAdvancedSettingsFragment notificationsAdvancedSettingsFragment) {
        this.arg$1 = notificationsAdvancedSettingsFragment;
    }

    public static Preference.OnPreferenceChangeListener lambdaFactory$(NotificationsAdvancedSettingsFragment notificationsAdvancedSettingsFragment) {
        return new NotificationsAdvancedSettingsFragment$$Lambda$2(notificationsAdvancedSettingsFragment);
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceChangeListener
    @LambdaForm.Hidden
    public boolean onPreferenceChange(Preference preference, Object obj) {
        return this.arg$1.lambda$onCreate$1(preference, obj);
    }
}
