package com.vkontakte.android.fragments.preference;

import android.content.Context;
import android.os.Bundle;
import android.support.v14.preference.PreferenceDialogFragment;
import android.view.View;
import android.widget.FrameLayout;
import com.flask.colorpicker.ColorPickerView;
import com.flask.colorpicker.renderer.FlowerColorWheelRenderer;
import com.vkontakte.android.ui.ColorPreference;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class ColorPreferenceDialogFragment extends PreferenceDialogFragment {
    public static ColorPreferenceDialogFragment newInstance(String key) {
        ColorPreferenceDialogFragment fragment = new ColorPreferenceDialogFragment();
        Bundle b = new Bundle(1);
        b.putString("key", key);
        fragment.setArguments(b);
        return fragment;
    }

    private ColorPreference getColorPreference() {
        return (ColorPreference) getPreference();
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment
    protected View onCreateDialogView(Context context) {
        ColorPickerView view = new ColorPickerView(getActivity());
        view.addOnColorSelectedListener(ColorPreferenceDialogFragment$$Lambda$1.lambdaFactory$(this));
        view.setRenderer(new FlowerColorWheelRenderer());
        view.setInitialColor(getColorPreference().getValue());
        int pad = V.dp(16.0f);
        view.setPadding(pad, pad, pad, pad);
        FrameLayout frameLayout = new FrameLayout(getActivity());
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(-2, -2);
        params.gravity = 17;
        frameLayout.addView(view, params);
        return frameLayout;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateDialogView$0(int selectedColor) {
        getColorPreference().setTransientValue((-16777216) | selectedColor);
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment
    public void onDialogClosed(boolean positiveResult) {
        if (positiveResult && getColorPreference().getTransientValue() != 0) {
            getColorPreference().setValue(getColorPreference().getTransientValue());
        }
    }
}
