package com.vk.stories.view;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;
/* loaded from: classes2.dex */
public class NoOverlappingRenderingImageView extends ImageView {
    public NoOverlappingRenderingImageView(Context context) {
        super(context);
    }

    public NoOverlappingRenderingImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public NoOverlappingRenderingImageView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override // android.widget.ImageView, android.view.View
    public boolean hasOverlappingRendering() {
        return false;
    }
}
