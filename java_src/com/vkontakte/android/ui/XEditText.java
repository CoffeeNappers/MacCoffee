package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.inputmethod.InputConnectionWrapper;
/* loaded from: classes3.dex */
public class XEditText extends android.widget.EditText {
    private View.OnKeyListener keyListener;

    public XEditText(Context context) {
        super(context);
    }

    public XEditText(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public XEditText(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.widget.TextView, android.view.View
    public InputConnection onCreateInputConnection(EditorInfo outAttrs) {
        return new ZanyInputConnection(super.onCreateInputConnection(outAttrs), true);
    }

    @Override // android.view.View
    public void setOnKeyListener(View.OnKeyListener l) {
        this.keyListener = l;
        super.setOnKeyListener(l);
    }

    /* loaded from: classes3.dex */
    private class ZanyInputConnection extends InputConnectionWrapper {
        public ZanyInputConnection(InputConnection target, boolean mutable) {
            super(target, mutable);
        }

        @Override // android.view.inputmethod.InputConnectionWrapper, android.view.inputmethod.InputConnection
        public boolean sendKeyEvent(KeyEvent event) {
            if (event.getAction() == 0 && event.getKeyCode() == 67 && XEditText.this.keyListener != null) {
                XEditText.this.keyListener.onKey(XEditText.this, event.getKeyCode(), event);
            }
            return super.sendKeyEvent(event);
        }
    }
}
