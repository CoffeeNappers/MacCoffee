package com.vk.attachpicker.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.widget.EditText;
/* loaded from: classes2.dex */
public class BackPressEditText extends EditText {
    private OnBackPressedCallback callback;

    /* loaded from: classes2.dex */
    public interface OnBackPressedCallback {
        void onBackPressed();
    }

    public BackPressEditText(Context context) {
        super(context);
    }

    public BackPressEditText(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public BackPressEditText(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public OnBackPressedCallback getCallback() {
        return this.callback;
    }

    public void setCallback(OnBackPressedCallback callback) {
        this.callback = callback;
    }

    @Override // android.widget.TextView, android.view.View
    public boolean onKeyPreIme(int keyCode, KeyEvent event) {
        if (keyCode == 4 && event.getAction() == 1 && this.callback != null) {
            this.callback.onBackPressed();
            return true;
        }
        return super.onKeyPreIme(keyCode, event);
    }
}
