package com.vkontakte.android.fragments;

import android.content.DialogInterface;
import android.widget.RadioButton;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class SettingsAccountInnerFragment$$Lambda$8 implements DialogInterface.OnClickListener {
    private final SettingsAccountInnerFragment arg$1;
    private final RadioButton arg$2;

    private SettingsAccountInnerFragment$$Lambda$8(SettingsAccountInnerFragment settingsAccountInnerFragment, RadioButton radioButton) {
        this.arg$1 = settingsAccountInnerFragment;
        this.arg$2 = radioButton;
    }

    public static DialogInterface.OnClickListener lambdaFactory$(SettingsAccountInnerFragment settingsAccountInnerFragment, RadioButton radioButton) {
        return new SettingsAccountInnerFragment$$Lambda$8(settingsAccountInnerFragment, radioButton);
    }

    @Override // android.content.DialogInterface.OnClickListener
    @LambdaForm.Hidden
    public void onClick(DialogInterface dialogInterface, int i) {
        this.arg$1.lambda$null$4(this.arg$2, dialogInterface, i);
    }
}
