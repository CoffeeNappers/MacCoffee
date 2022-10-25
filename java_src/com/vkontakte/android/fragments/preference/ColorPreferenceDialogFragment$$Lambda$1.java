package com.vkontakte.android.fragments.preference;

import com.flask.colorpicker.OnColorSelectedListener;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class ColorPreferenceDialogFragment$$Lambda$1 implements OnColorSelectedListener {
    private final ColorPreferenceDialogFragment arg$1;

    private ColorPreferenceDialogFragment$$Lambda$1(ColorPreferenceDialogFragment colorPreferenceDialogFragment) {
        this.arg$1 = colorPreferenceDialogFragment;
    }

    public static OnColorSelectedListener lambdaFactory$(ColorPreferenceDialogFragment colorPreferenceDialogFragment) {
        return new ColorPreferenceDialogFragment$$Lambda$1(colorPreferenceDialogFragment);
    }

    @Override // com.flask.colorpicker.OnColorSelectedListener
    @LambdaForm.Hidden
    public void onColorSelected(int i) {
        this.arg$1.lambda$onCreateDialogView$0(i);
    }
}
