package com.vkontakte.android.fragments;

import android.support.v7.preference.Preference;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsDebugFragment$$Lambda$7 implements Preference.OnPreferenceClickListener {
    private static final SettingsDebugFragment$$Lambda$7 instance = new SettingsDebugFragment$$Lambda$7();

    private SettingsDebugFragment$$Lambda$7() {
    }

    public static Preference.OnPreferenceClickListener lambdaFactory$() {
        return instance;
    }

    @Override // android.support.v7.preference.Preference.OnPreferenceClickListener
    @LambdaForm.Hidden
    public boolean onPreferenceClick(Preference preference) {
        return SettingsDebugFragment.lambda$onCreate$7(preference);
    }
}
