package com.vkontakte.android.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.support.v7.preference.Preference;
import android.util.AttributeSet;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class MaterialSectionDividerPreference extends Preference {
    public MaterialSectionDividerPreference(Context context) {
        super(context);
    }

    public MaterialSectionDividerPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        setLayoutResource(R.layout.material_preference_divider);
    }

    public MaterialSectionDividerPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @TargetApi(21)
    public MaterialSectionDividerPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // android.support.v7.preference.Preference
    public boolean getShouldDisableView() {
        return true;
    }

    @Override // android.support.v7.preference.Preference
    public boolean isEnabled() {
        return false;
    }

    @Override // android.support.v7.preference.Preference
    public boolean hasKey() {
        return false;
    }

    @Override // android.support.v7.preference.Preference
    public boolean isSelectable() {
        return false;
    }
}
