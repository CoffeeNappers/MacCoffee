package com.vkontakte.android.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
/* loaded from: classes3.dex */
public class AudioSquareFrameLayout extends FrameLayout {
    private float density;
    private boolean isHorizontal;

    public AudioSquareFrameLayout(Context context) {
        super(context);
        this.density = getContext().getResources().getDisplayMetrics().density;
    }

    public AudioSquareFrameLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.density = getContext().getResources().getDisplayMetrics().density;
        init(attrs);
    }

    public AudioSquareFrameLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.density = getContext().getResources().getDisplayMetrics().density;
        init(attrs);
    }

    public AudioSquareFrameLayout(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.density = getContext().getResources().getDisplayMetrics().density;
        init(attrs);
    }

    private void init(AttributeSet attrs) {
        boolean z = true;
        TypedArray ta = getContext().obtainStyledAttributes(attrs, new int[]{16842948});
        if (ta.getInt(0, 1) != 0) {
            z = false;
        }
        this.isHorizontal = z;
        ta.recycle();
    }

    @Override // android.widget.FrameLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int maxW = View.MeasureSpec.getSize(widthMeasureSpec);
        int maxH = View.MeasureSpec.getSize(heightMeasureSpec);
        if (!this.isHorizontal) {
            if (maxH >= maxW) {
                heightMeasureSpec = 1073741824 | maxW;
                FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) getChildAt(0).getLayoutParams();
                lp.topMargin = -getPaddingTop();
                lp.bottomMargin = 0;
            } else {
                FrameLayout.LayoutParams lp2 = (FrameLayout.LayoutParams) getChildAt(0).getLayoutParams();
                int round = Math.round(this.density * 16.0f);
                lp2.bottomMargin = round;
                lp2.topMargin = round;
            }
        } else {
            boolean forcePad = false;
            if (maxH > maxW / 2) {
                maxH = maxW / 2;
                forcePad = true;
            }
            if (maxW >= maxH) {
                widthMeasureSpec = 1073741824 | maxH;
                FrameLayout.LayoutParams lp3 = (FrameLayout.LayoutParams) getChildAt(0).getLayoutParams();
                if (forcePad) {
                    int round2 = Math.round(this.density * 16.0f);
                    lp3.rightMargin = round2;
                    lp3.leftMargin = round2;
                } else {
                    lp3.topMargin = -getPaddingTop();
                    lp3.bottomMargin = 0;
                    lp3.rightMargin = 0;
                    lp3.leftMargin = 0;
                }
            } else {
                FrameLayout.LayoutParams lp4 = (FrameLayout.LayoutParams) getChildAt(0).getLayoutParams();
                int round3 = Math.round(this.density * 16.0f);
                lp4.rightMargin = round3;
                lp4.leftMargin = round3;
            }
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    @Override // android.view.View
    protected boolean fitSystemWindows(Rect insets) {
        setPadding(getPaddingLeft(), insets.top, getPaddingRight(), 0);
        setClipToPadding(false);
        return false;
    }
}
