package com.vkontakte.android.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class SquareImageView extends ImageView {
    private Drawable mForegroundSelector;
    private int mSize;
    private boolean mUseBackgroundPadding;

    public SquareImageView(Context context) {
        this(context, null);
    }

    public SquareImageView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public SquareImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mUseBackgroundPadding = false;
        this.mSize = -1;
        init(context, attrs, defStyle);
    }

    @TargetApi(21)
    public SquareImageView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mUseBackgroundPadding = false;
        this.mSize = -1;
        init(context, attrs, defStyleRes);
    }

    private void init(Context context, AttributeSet attrs, int defStyle) {
        TypedArray a;
        if (attrs != null && (a = context.obtainStyledAttributes(attrs, R.styleable.FrameLayout, defStyle, 0)) != null) {
            Drawable d = a.getDrawable(0);
            this.mUseBackgroundPadding = a.getBoolean(1, false);
            if (d != null) {
                setForeground(d);
            }
            a.recycle();
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mForegroundSelector != null && this.mForegroundSelector.isStateful()) {
            this.mForegroundSelector.setState(getDrawableState());
        }
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        if (this.mForegroundSelector != null) {
            if (this.mUseBackgroundPadding) {
                this.mForegroundSelector.setBounds(getPaddingLeft(), getPaddingTop(), w - getPaddingRight(), h - getPaddingBottom());
            } else {
                this.mForegroundSelector.setBounds(0, 0, w, h);
            }
        }
    }

    @Override // android.view.View
    protected void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (this.mForegroundSelector != null) {
            this.mForegroundSelector.draw(canvas);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected boolean verifyDrawable(Drawable who) {
        return super.verifyDrawable(who) || who == this.mForegroundSelector;
    }

    @Override // android.widget.ImageView, android.view.View
    public void jumpDrawablesToCurrentState() {
        super.jumpDrawablesToCurrentState();
        if (this.mForegroundSelector != null) {
            this.mForegroundSelector.jumpToCurrentState();
        }
    }

    @Override // android.widget.ImageView, android.view.View
    @TargetApi(21)
    public void drawableHotspotChanged(float x, float y) {
        super.drawableHotspotChanged(x, y);
        if (this.mForegroundSelector != null) {
            this.mForegroundSelector.setHotspot(x, y);
        }
    }

    @Override // android.view.View
    public void setForeground(Drawable drawable) {
        if (this.mForegroundSelector != drawable) {
            if (this.mForegroundSelector != null) {
                this.mForegroundSelector.setCallback(null);
                unscheduleDrawable(this.mForegroundSelector);
            }
            this.mForegroundSelector = drawable;
            if (drawable != null) {
                setWillNotDraw(false);
                drawable.setCallback(this);
                if (drawable.isStateful()) {
                    drawable.setState(getDrawableState());
                }
            } else {
                setWillNotDraw(true);
            }
            requestLayout();
            invalidate();
        }
    }

    public void setSize(int size) {
        if (size != this.mSize) {
            this.mSize = size;
            requestLayout();
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (this.mSize > 0) {
            int size = View.MeasureSpec.makeMeasureSpec(this.mSize, 1073741824);
            super.onMeasure(size, size);
            return;
        }
        super.onMeasure(widthMeasureSpec, widthMeasureSpec);
    }
}
