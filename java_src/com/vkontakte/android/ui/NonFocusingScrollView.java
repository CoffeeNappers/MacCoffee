package com.vkontakte.android.ui;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ScrollView;
import java.util.ArrayList;
/* loaded from: classes3.dex */
public class NonFocusingScrollView extends ScrollView {
    public NonFocusingScrollView(Context context) {
        super(context);
    }

    public NonFocusingScrollView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public NonFocusingScrollView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.widget.ScrollView, android.view.ViewGroup
    protected boolean onRequestFocusInDescendants(int direction, Rect previouslyFocusedRect) {
        return false;
    }

    @Override // android.view.View
    public ArrayList<View> getFocusables(int direction) {
        return new ArrayList<>();
    }
}
