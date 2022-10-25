package com.vkontakte.android.fragments;

import android.support.v7.preference.Preference;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class NotificationsAdvancedSettingsFragment$$Lambda$1 implements Preference.OnPreferenceClickListener {
    private final NotificationsAdvancedSettingsFragment arg$1;

    private NotificationsAdvancedSettingsFragment$$Lambda$1(NotificationsAdvancedSettingsFragment notificationsAdvancedSettingsFragment) {
        this.arg$1 = notificationsAdvancedSettingsFragment;
    }

    public static Preference.OnPreferenceClickListener lambdaFactory$(NotificationsAdvancedSettingsFragment notificationsAdvancedSettingsFragment) {
        return new NotificationsAdvancedSettingsFragment$$Lambda$1(notificationsAdvancedSettingsFragment);
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceClickListener
    @LambdaForm.Hidden
    public boolean onPreferenceClick(Preference preference) {
        return this.arg$1.lambda$onCreate$0(preference);
    }
}
