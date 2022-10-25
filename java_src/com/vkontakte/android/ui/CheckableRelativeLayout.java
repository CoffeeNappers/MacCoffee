package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewDebug;
import android.widget.Checkable;
import android.widget.CompoundButton;
import android.widget.RelativeLayout;
/* loaded from: classes.dex */
public class CheckableRelativeLayout extends RelativeLayout implements Checkable {
    private OnCheckedChangeListener mCheckChangedListener;
    private CompoundButton.OnCheckedChangeListener mCheckedChangedListenerDelegate;
    private CompoundButton mCompoundButton;

    /* loaded from: classes3.dex */
    public interface OnCheckedChangeListener {
        void onCheckedChanged(View view, boolean z);
    }

    public CheckableRelativeLayout(Context context) {
        this(context, null);
    }

    public CheckableRelativeLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public CheckableRelativeLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mCheckedChangedListenerDelegate = new CompoundButton.OnCheckedChangeListener() { // from class: com.vkontakte.android.ui.CheckableRelativeLayout.1
            @Override // android.widget.CompoundButton.OnCheckedChangeListener
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if (CheckableRelativeLayout.this.mCheckChangedListener != null) {
                    CheckableRelativeLayout.this.mCheckChangedListener.onCheckedChanged(CheckableRelativeLayout.this, isChecked);
                }
            }
        };
    }

    @Override // android.view.View
    protected void onFinishInflate() {
        super.onFinishInflate();
        this.mCompoundButton = (CompoundButton) findViewById(16908289);
        this.mCompoundButton.setOnCheckedChangeListener(this.mCheckedChangedListenerDelegate);
    }

    @Override // android.widget.Checkable
    public void toggle() {
        this.mCompoundButton.toggle();
    }

    @Override // android.widget.Checkable
    @ViewDebug.ExportedProperty
    public boolean isChecked() {
        return this.mCompoundButton.isChecked();
    }

    @Override // android.widget.Checkable
    public void setChecked(boolean checked) {
        if (this.mCompoundButton != null) {
            this.mCompoundButton.setChecked(checked);
        }
        if (this.mCheckChangedListener != null) {
            this.mCheckChangedListener.onCheckedChanged(this, checked);
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        boolean result = false;
        int action = event.getAction();
        if (action == 0 || action == 3 || action == 1) {
            result = false | this.mCompoundButton.onTouchEvent(event);
        }
        return result || super.onTouchEvent(event);
    }

    public void setOnCheckedChangedListener(OnCheckedChangeListener mListener) {
        this.mCheckChangedListener = mListener;
    }
}
