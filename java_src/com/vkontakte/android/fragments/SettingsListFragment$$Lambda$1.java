package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsListFragment$$Lambda$1 implements DialogInterface.OnClickListener {
    private final SettingsListFragment arg$1;

    private SettingsListFragment$$Lambda$1(SettingsListFragment settingsListFragment) {
        this.arg$1 = settingsListFragment;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(SettingsListFragment settingsListFragment) {
        return new SettingsListFragment$$Lambda$1(settingsListFragment);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$onActivityResult$0(dialogInterface, i);
    }
}
