package com.vkontakte.android.ui;

import android.content.Context;
import android.support.v7.preference.ListPreference;
import android.util.AttributeSet;
/* loaded from: classes3.dex */
public class SummaryListPreference extends ListPreference {
    public SummaryListPreference(Context context) {
        super(context);
    }

    public SummaryListPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public SummaryListPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public SummaryListPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // android.support.v7.preference.ListPreference
    public void setValue(String value) {
        super.setValue(value);
        updateSummary();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.ListPreference, android.support.v7.preference.Preference
    public void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        super.onSetInitialValue(restoreValue, defaultValue);
        updateSummary();
    }

    private void updateSummary() {
        setSummary(getEntry());
    }
}
