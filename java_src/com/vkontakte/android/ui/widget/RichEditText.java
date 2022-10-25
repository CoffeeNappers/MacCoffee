package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.v7.widget.AppCompatEditText;
import android.util.AttributeSet;
import android.view.KeyEvent;
/* loaded from: classes3.dex */
public class RichEditText extends AppCompatEditText {
    private boolean keepFocus;
    public OnKeyPreImeListener onKeyPreImeListener;

    /* loaded from: classes3.dex */
    public interface OnKeyPreImeListener {
        boolean onKeyPreIme(int i, KeyEvent keyEvent);
    }

    public RichEditText(Context context) {
        super(context);
    }

    public RichEditText(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public RichEditText(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override // android.view.View
    public void clearFocus() {
        if (!this.keepFocus) {
            super.clearFocus();
        }
    }

    public final void setKeepFocus(boolean keepFocus) {
        this.keepFocus = keepFocus;
        if (!keepFocus && hasFocus()) {
            clearFocus();
            requestFocus();
        }
    }

    @Override // android.widget.TextView, android.view.View
    public boolean onKeyPreIme(int keyCode, KeyEvent event) {
        if (this.onKeyPreImeListener != null) {
            return this.onKeyPreImeListener.onKeyPreIme(keyCode, event);
        }
        return false;
    }
}
