package com.vkontakte.android.fragments;

import com.vkontakte.android.fragments.SettingsListFragment;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsListFragment$SettingsAdapter$$Lambda$1 implements Runnable {
    private final SettingsListFragment.SettingsAdapter arg$1;

    private SettingsListFragment$SettingsAdapter$$Lambda$1(SettingsListFragment.SettingsAdapter settingsAdapter) {
        this.arg$1 = settingsAdapter;
    }

    public static Runnable lambdaFactory$(SettingsListFragment.SettingsAdapter settingsAdapter) {
        return new SettingsListFragment$SettingsAdapter$$Lambda$1(settingsAdapter);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$createData$0();
    }
}
