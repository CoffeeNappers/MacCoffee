package com.vk.core.view;

import android.content.Context;
import android.support.v7.widget.AppCompatEditText;
import android.util.AttributeSet;
import com.vkontakte.android.ui.Font;
/* loaded from: classes2.dex */
public final class RobotoMediumEditText extends AppCompatEditText {
    public RobotoMediumEditText(Context context) {
        super(context);
        init();
    }

    public RobotoMediumEditText(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public RobotoMediumEditText(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        setTypeface(Font.Medium.typeface);
    }
}
