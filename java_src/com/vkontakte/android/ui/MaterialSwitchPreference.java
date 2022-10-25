package com.vkontakte.android.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.support.v14.preference.SwitchPreference;
import android.support.v7.preference.PreferenceViewHolder;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Checkable;
import android.widget.CompoundButton;
import android.widget.Switch;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class MaterialSwitchPreference extends SwitchPreference {
    private final Listener mListener;

    /* loaded from: classes3.dex */
    private class Listener implements CompoundButton.OnCheckedChangeListener {
        private Listener() {
        }

        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            if (!MaterialSwitchPreference.this.callChangeListener(Boolean.valueOf(isChecked))) {
                buttonView.setChecked(!isChecked);
            } else {
                MaterialSwitchPreference.this.setChecked(isChecked);
            }
        }
    }

    public MaterialSwitchPreference(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mListener = new Listener();
        init();
    }

    @TargetApi(21)
    public MaterialSwitchPreference(Context context, AttributeSet attrs, int defStyleRes, int defStyleAttr) {
        super(context, attrs, defStyleRes, defStyleAttr);
        this.mListener = new Listener();
    }

    public MaterialSwitchPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mListener = new Listener();
        init();
    }

    public MaterialSwitchPreference(Context context) {
        super(context);
        this.mListener = new Listener();
        init();
    }

    private void init() {
        setWidgetLayoutResource(R.layout.preference_widget_switch);
    }

    @Override // android.support.v14.preference.SwitchPreference, android.support.v7.preference.Preference
    public void onBindViewHolder(PreferenceViewHolder holder) {
        super.onBindViewHolder(holder);
        View checkableView = holder.itemView.findViewById(R.id.switchWidget);
        if (checkableView != null && (checkableView instanceof Checkable)) {
            if (checkableView instanceof Switch) {
                ((Switch) checkableView).setOnCheckedChangeListener(null);
            }
            Checkable checkable = (Checkable) checkableView;
            checkable.setChecked(isChecked());
            if (checkableView instanceof Switch) {
                Switch switchView = (Switch) checkableView;
                switchView.setTextOn("");
                switchView.setTextOff("");
                switchView.setOnCheckedChangeListener(this.mListener);
            }
        }
    }
}
