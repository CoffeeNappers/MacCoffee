package com.vk.attachpicker.widget;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.TextView;
import com.vk.attachpicker.util.Fonts;
/* loaded from: classes2.dex */
public class RobotoMediumTextView extends TextView {
    public RobotoMediumTextView(Context context) {
        super(context);
        init();
    }

    public RobotoMediumTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public RobotoMediumTextView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        setTypeface(Fonts.getRobotoMedium());
    }
}
