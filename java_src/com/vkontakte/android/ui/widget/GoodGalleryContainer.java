package com.vkontakte.android.ui.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class GoodGalleryContainer extends FrameLayout {
    boolean isTablet;

    public GoodGalleryContainer(Context context) {
        super(context);
        this.isTablet = true;
    }

    public GoodGalleryContainer(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.isTablet = true;
    }

    public GoodGalleryContainer(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.isTablet = true;
    }

    public void setIsTablet(boolean isTablet) {
        this.isTablet = isTablet;
    }

    @TargetApi(21)
    public GoodGalleryContainer(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.isTablet = true;
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int heightMeasureSpec2;
        int width = View.MeasureSpec.getSize(widthMeasureSpec);
        if (!this.isTablet && getContext().getResources().getConfiguration().orientation == 2) {
            heightMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(Math.min(V.dp(240.0f), width), 1073741824);
        } else {
            heightMeasureSpec2 = View.MeasureSpec.makeMeasureSpec(width, 1073741824);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec2);
    }
}
