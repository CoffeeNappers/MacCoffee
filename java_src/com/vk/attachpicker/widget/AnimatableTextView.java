package com.vk.attachpicker.widget;

import android.content.Context;
import android.util.AttributeSet;
/* loaded from: classes2.dex */
public class AnimatableTextView extends RobotoMediumTextView {
    private int backgroundColor;
    private int textColor;

    public AnimatableTextView(Context context) {
        super(context);
    }

    public AnimatableTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public AnimatableTextView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public int getTextColor() {
        return this.textColor;
    }

    @Override // android.widget.TextView
    public void setTextColor(int textColor) {
        super.setTextColor(textColor);
        this.textColor = textColor;
    }

    public int getBackgroundColor() {
        return this.backgroundColor;
    }

    @Override // android.view.View
    public void setBackgroundColor(int backgroundColor) {
        super.setBackgroundColor(backgroundColor);
        this.backgroundColor = backgroundColor;
    }
}
