package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.ScrollView;
import com.vkontakte.android.Global;
/* loaded from: classes3.dex */
public class AlbumScrollView extends ScrollView {
    public int heightMSpec;
    public int widthMSpec;

    public AlbumScrollView(Context context) {
        super(context);
    }

    public AlbumScrollView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public AlbumScrollView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.widget.ScrollView, android.widget.FrameLayout, android.view.View
    public void onMeasure(int wms, int hms) {
        this.widthMSpec = wms;
        this.heightMSpec = hms;
        super.onMeasure(wms, hms);
    }

    @Override // android.widget.ScrollView, android.view.View
    protected float getTopFadingEdgeStrength() {
        return 0.0f;
    }

    @Override // android.widget.ScrollView, android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        return isEnabled() && super.onTouchEvent(ev);
    }

    @Override // android.view.View
    protected void onScrollChanged(int x, int y, int oldx, int oldy) {
        super.onScrollChanged(x, y, oldx, oldy);
        setVerticalFadingEdgeEnabled(true);
        setFadingEdgeLength(Math.min(Global.scale(20.0f), y));
    }
}
