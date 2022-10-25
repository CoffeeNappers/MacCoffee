package com.vkontakte.android.ui.widget;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.TypedArray;
import android.support.annotation.Nullable;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class BubbleLayout extends LinearLayout {
    private int idBody;
    private int idImage;
    private int idTime;
    private int mGravityImpl;

    public BubbleLayout(Context context) {
        super(context);
        this.idImage = -1;
        this.idBody = -1;
        this.idTime = -1;
    }

    public BubbleLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.idImage = -1;
        this.idBody = -1;
        this.idTime = -1;
        init(attrs);
    }

    public BubbleLayout(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.idImage = -1;
        this.idBody = -1;
        this.idTime = -1;
        init(attrs);
    }

    private void init(AttributeSet attrs) {
        TypedArray a = getContext().obtainStyledAttributes(attrs, R.styleable.BubbleLayout);
        if (a != null) {
            this.idImage = a.getResourceId(0, this.idImage);
            this.idBody = a.getResourceId(1, this.idBody);
            this.idTime = a.getResourceId(2, this.idTime);
            a.recycle();
        }
    }

    @Override // android.widget.LinearLayout
    public void setGravity(int gravity) {
        super.setGravity(gravity);
        this.mGravityImpl = gravity;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    @SuppressLint({"RtlHardcoded"})
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int layoutDirection = ViewCompat.getLayoutDirection(this);
        if ((Gravity.getAbsoluteGravity(this.mGravityImpl, layoutDirection) & 5) == 5) {
            onLayoutRightToLeft(l, t, r, b);
        } else {
            onLayoutLeftToRight(l, t, r, b);
        }
    }

    private void onLayoutLeftToRight(int l, int t, int r, int b) {
        int startX = 0;
        int h = b - t;
        for (int i = 0; i < getChildCount(); i++) {
            View view = getChildAt(i);
            int startX2 = startX + getMarginLeft(view);
            int nextX = startX2 + view.getMeasuredWidth();
            int gravity = ((LinearLayout.LayoutParams) view.getLayoutParams()).gravity;
            if ((gravity & 48) == 48) {
                view.layout(startX2, getPaddingTop(), nextX, getPaddingTop() + view.getMeasuredHeight());
            } else if ((gravity & 80) == 80) {
                view.layout(startX2, (h - getPaddingBottom()) - view.getMeasuredHeight(), nextX, h - getPaddingBottom());
            } else {
                int dh = (((h - getPaddingBottom()) - getPaddingTop()) - view.getMeasuredHeight()) / 2;
                view.layout(startX2, getPaddingTop() + dh, nextX, (h - getPaddingBottom()) - dh);
            }
            startX = nextX + getMarginRight(view);
        }
    }

    private void onLayoutRightToLeft(int l, int t, int r, int b) {
        int nextX = r - l;
        int h = b - t;
        for (int i = getChildCount() - 1; i >= 0; i--) {
            View view = getChildAt(i);
            int nextX2 = nextX - getMarginRight(view);
            int startX = nextX2 - view.getMeasuredWidth();
            int gravity = ((LinearLayout.LayoutParams) view.getLayoutParams()).gravity;
            if ((gravity & 48) == 48) {
                view.layout(startX, getPaddingTop(), nextX2, getPaddingTop() + view.getMeasuredHeight());
            } else if ((gravity & 80) == 80) {
                view.layout(startX, (h - getPaddingBottom()) - view.getMeasuredHeight(), nextX2, h - getPaddingBottom());
            } else {
                int dh = (((h - getPaddingBottom()) - getPaddingTop()) - view.getMeasuredHeight()) / 2;
                view.layout(startX, getPaddingTop() + dh, nextX2, (h - getPaddingBottom()) - dh);
            }
            nextX = startX - getMarginLeft(view);
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        View viewImage = findViewById(this.idImage);
        View viewBubble = findViewById(this.idBody);
        View viewTime = findViewById(this.idTime);
        measureChild(viewImage, widthMeasureSpec, heightMeasureSpec);
        measureChild(viewTime, widthMeasureSpec, heightMeasureSpec);
        int width = View.MeasureSpec.getSize(widthMeasureSpec);
        measureChild(viewBubble, View.MeasureSpec.makeMeasureSpec(((width - getMeasuredWidthWithMargin(viewImage)) - getMeasuredWidthWithMargin(viewTime)) - getMarginWidth(viewBubble), Integer.MIN_VALUE), heightMeasureSpec);
        int maxChildHeight = Math.max(getMeasuredHeight(viewImage), Math.max(getMeasuredHeight(viewBubble), getMeasuredHeight(viewTime)));
        setMeasuredDimension(View.MeasureSpec.getSize(widthMeasureSpec), getPaddingTop() + getPaddingBottom() + maxChildHeight);
    }

    @Override // android.view.ViewGroup
    protected void measureChild(@Nullable View child, int parentWidthMeasureSpec, int parentHeightMeasureSpec) {
        if (child != null) {
            super.measureChild(child, parentWidthMeasureSpec, parentHeightMeasureSpec);
        }
    }

    private static int getMeasuredWidthWithMargin(@Nullable View view) {
        if (view == null) {
            return 0;
        }
        return view.getMeasuredWidth() + getMarginWidth(view);
    }

    private static int getMeasuredHeight(@Nullable View view) {
        if (view == null) {
            return 0;
        }
        return view.getMeasuredHeight();
    }

    private static int getMarginWidth(@Nullable View view) {
        if (view == null) {
            return 0;
        }
        LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) view.getLayoutParams();
        return lp.leftMargin + lp.rightMargin;
    }

    private static int getMarginLeft(@Nullable View view) {
        if (view == null) {
            return 0;
        }
        return ((LinearLayout.LayoutParams) view.getLayoutParams()).leftMargin;
    }

    private static int getMarginRight(@Nullable View view) {
        if (view == null) {
            return 0;
        }
        return ((LinearLayout.LayoutParams) view.getLayoutParams()).rightMargin;
    }
}
