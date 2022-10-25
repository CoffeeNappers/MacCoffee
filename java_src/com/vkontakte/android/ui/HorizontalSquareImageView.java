package com.vkontakte.android.ui;

import android.content.Context;
import android.util.AttributeSet;
import android.widget.ImageView;
/* loaded from: classes3.dex */
public class HorizontalSquareImageView extends ImageView {
    public HorizontalSquareImageView(Context context) {
        super(context);
    }

    public HorizontalSquareImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public HorizontalSquareImageView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(heightMeasureSpec, heightMeasureSpec);
    }
}
