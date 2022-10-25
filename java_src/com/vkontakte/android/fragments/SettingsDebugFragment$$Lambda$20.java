package com.vkontakte.android.fragments;

import android.app.DatePickerDialog;
import android.widget.DatePicker;
import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class SettingsDebugFragment$$Lambda$20 implements DatePickerDialog.OnDateSetListener {
    private final SettingsDebugFragment arg$1;

    private SettingsDebugFragment$$Lambda$20(SettingsDebugFragment settingsDebugFragment) {
        this.arg$1 = settingsDebugFragment;
    }

    public static DatePickerDialog.OnDateSetListener lambdaFactory$(SettingsDebugFragment settingsDebugFragment) {
        return new SettingsDebugFragment$$Lambda$20(settingsDebugFragment);
    }

    @Override // android.app.DatePickerDialog.OnDateSetListener
    @LambdaForm.Hidden
    public void onDateSet(DatePicker datePicker, int i, int i2, int i3) {
        this.arg$1.lambda$null$2(datePicker, i, i2, i3);
    }
}
