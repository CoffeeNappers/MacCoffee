package com.vk.stories.view;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.FrameLayout;
/* loaded from: classes2.dex */
public class NoOverlappingRenderingFrameLayout extends FrameLayout {
    public NoOverlappingRenderingFrameLayout(Context context) {
        super(context);
    }

    public NoOverlappingRenderingFrameLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public NoOverlappingRenderingFrameLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override // android.view.View
    public boolean hasOverlappingRendering() {
        return false;
    }
}
