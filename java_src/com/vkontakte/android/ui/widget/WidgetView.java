package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.widget.LinearLayout;
/* loaded from: classes3.dex */
public abstract class WidgetView extends LinearLayout implements WidgetBinder {
    public WidgetView(Context context) {
        this(context, null);
    }

    public WidgetView(Context context, @Nullable AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public WidgetView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        setOrientation(1);
    }
}
