package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
/* loaded from: classes3.dex */
public class AlwaysSelectedTextView extends android.widget.TextView {
    public AlwaysSelectedTextView(Context context) {
        super(context);
    }

    public AlwaysSelectedTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public AlwaysSelectedTextView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.view.View
    public boolean isSelected() {
        return true;
    }
}
