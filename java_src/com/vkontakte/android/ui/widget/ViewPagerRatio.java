package com.vkontakte.android.ui.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.view.View;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class ViewPagerRatio extends ViewPager {
    private int maxHeight;
    private float ratio;

    public ViewPagerRatio(Context context) {
        super(context);
        this.ratio = 0.0f;
        this.maxHeight = 0;
    }

    public ViewPagerRatio(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.ratio = 0.0f;
        this.maxHeight = 0;
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ViewPagerRatio);
        if (a != null) {
            this.ratio = a.getFloat(0, this.ratio);
            this.maxHeight = a.getDimensionPixelOffset(1, this.maxHeight);
            a.recycle();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.support.v4.view.ViewPager, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (this.ratio != 0.0f) {
            int w = View.MeasureSpec.getSize(widthMeasureSpec);
            if (this.maxHeight != 0) {
                int neededHeight = Math.min(this.maxHeight, (int) (w * this.ratio));
                int wNew = (int) (neededHeight / this.ratio);
                setPadding((w - wNew) / 2, getPaddingTop(), (w - wNew) / 2, getPaddingBottom());
                heightMeasureSpec = View.MeasureSpec.makeMeasureSpec((int) (wNew * this.ratio), 1073741824);
            } else {
                heightMeasureSpec = View.MeasureSpec.makeMeasureSpec((int) (w * this.ratio), 1073741824);
            }
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }
}
