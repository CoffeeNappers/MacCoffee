package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsNotificationsFragment$$Lambda$8 implements DialogInterface.OnClickListener {
    private final SettingsNotificationsFragment arg$1;

    private SettingsNotificationsFragment$$Lambda$8(SettingsNotificationsFragment settingsNotificationsFragment) {
        this.arg$1 = settingsNotificationsFragment;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(SettingsNotificationsFragment settingsNotificationsFragment) {
        return new SettingsNotificationsFragment$$Lambda$8(settingsNotificationsFragment);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$showDndDialog$7(dialogInterface, i);
    }
}
