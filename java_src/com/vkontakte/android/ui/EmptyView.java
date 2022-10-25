package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class EmptyView extends LinearLayout {
    public EmptyView(Context context) {
        super(context);
    }

    public EmptyView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public EmptyView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    public static EmptyView create(Context context) {
        EmptyView r = (EmptyView) View.inflate(context, R.layout.empty, null);
        r.setLayoutParams(new FrameLayout.LayoutParams(-1, -2, 17));
        r.findViewById(R.id.empty_button).setVisibility(8);
        return r;
    }

    public void setText(CharSequence text) {
        setText(this, text);
    }

    public void setText(int resID) {
        setText(this, resID);
    }

    public void setButtonText(CharSequence text) {
        setButtonText(this, text);
    }

    public void setButtonText(int resID) {
        setButtonText(this, resID);
    }

    public void setOnBtnClickListener(View.OnClickListener listener) {
        setOnBtnClickListener(this, listener);
    }

    public void setButtonVisible(boolean visible) {
        setButtonVisible(this, visible);
    }

    public static void setText(View view, CharSequence text) {
        ((android.widget.TextView) view.findViewById(R.id.empty_text)).setText(text);
    }

    public static void setText(View view, int resID) {
        ((android.widget.TextView) view.findViewById(R.id.empty_text)).setText(resID);
    }

    public static void setButtonText(View view, CharSequence text) {
        ((android.widget.TextView) view.findViewById(R.id.empty_button)).setText(text);
    }

    public static void setButtonText(View view, int resID) {
        ((android.widget.TextView) view.findViewById(R.id.empty_button)).setText(resID);
    }

    public static void setOnBtnClickListener(View view, View.OnClickListener listener) {
        view.findViewById(R.id.empty_button).setOnClickListener(listener);
    }

    public static void setButtonVisible(View view, boolean visible) {
        view.findViewById(R.id.empty_button).setVisibility(visible ? 0 : 8);
    }
}
