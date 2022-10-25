package com.vkontakte.android.ui.movie;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;
/* loaded from: classes3.dex */
public class PlayButton extends ImageView {
    public PlayButton(Context context) {
        super(context);
    }

    public PlayButton(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public PlayButton(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @TargetApi(21)
    public PlayButton(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // android.view.View
    public void dispatchDrawableHotspotChanged(float x, float y) {
        super.dispatchDrawableHotspotChanged(getWidth() >> 1, getHeight() >> 1);
    }

    @Override // android.widget.ImageView, android.view.View
    public void drawableHotspotChanged(float x, float y) {
        super.drawableHotspotChanged(getWidth() >> 1, getHeight() >> 1);
    }
}
