package com.vkontakte.android.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.support.v7.preference.DialogPreference;
import android.support.v7.preference.PreferenceViewHolder;
import android.util.AttributeSet;
import android.view.ContextThemeWrapper;
import com.flask.colorpicker.CircleColorDrawable;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class ColorPreference extends DialogPreference {
    private boolean needThemedContext;
    private Context themedContext;
    private int transientValue;
    private int value;

    public int getValue() {
        return this.value;
    }

    public void setValue(int value) {
        this.value = value;
        persistInt(value);
        notifyChanged();
    }

    public int getTransientValue() {
        return this.transientValue;
    }

    public void setTransientValue(int transientValue) {
        this.transientValue = transientValue;
    }

    public ColorPreference(Context context) {
        super(context);
        this.needThemedContext = false;
        this.value = 0;
    }

    public ColorPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.needThemedContext = false;
        this.value = 0;
        setWidgetLayoutResource(R.layout.color_preference_widget);
    }

    public ColorPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.needThemedContext = false;
        this.value = 0;
    }

    public ColorPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.needThemedContext = false;
        this.value = 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v7.preference.Preference
    public void onSetInitialValue(boolean restorePersistedValue, Object defaultValue) {
        super.onSetInitialValue(restorePersistedValue, defaultValue);
        if (restorePersistedValue) {
            this.value = getPersistedInt(-1);
        } else if (defaultValue != null) {
            this.value = ((Integer) defaultValue).intValue();
            persistInt(this.value);
        } else {
            this.value = -1;
        }
    }

    @Override // android.support.v7.preference.Preference
    protected Object onGetDefaultValue(TypedArray a, int index) {
        int defaultValue = a.getInt(index, -1);
        return Integer.valueOf(defaultValue);
    }

    @Override // android.support.v7.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder holder) {
        super.onBindViewHolder(holder);
        holder.itemView.findViewById(R.id.color_pref_widget).setBackgroundDrawable(new CircleColorDrawable(this.value));
    }

    @Override // android.support.v7.preference.Preference
    public Context getContext() {
        if (this.themedContext == null) {
            this.themedContext = new ContextThemeWrapper(super.getContext(), Build.VERSION.SDK_INT < 21 ? 16973935 : 16974374);
        }
        if (this.needThemedContext) {
            this.needThemedContext = false;
            return this.themedContext;
        }
        return super.getContext();
    }
}
