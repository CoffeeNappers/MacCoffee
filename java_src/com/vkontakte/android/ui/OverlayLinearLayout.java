package com.vkontakte.android.ui;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import com.vkontakte.android.R;
/* loaded from: classes3.dex */
public class OverlayLinearLayout extends LinearLayout {
    private Drawable overlay;
    private boolean padAsBg;
    private int padBtm;
    private int padLeft;
    private boolean padOverlay;
    private int padRight;
    private int padTop;

    public OverlayLinearLayout(Context context) {
        super(context);
        this.padOverlay = false;
        this.padAsBg = false;
    }

    public OverlayLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.padOverlay = false;
        this.padAsBg = false;
        init(attrs, 0);
    }

    public OverlayLinearLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.padOverlay = false;
        this.padAsBg = false;
        init(attrs, defStyle);
    }

    private void init(AttributeSet attrs, int defStyle) {
        if (attrs != null) {
            TypedArray a = getContext().obtainStyledAttributes(attrs, R.styleable.OverlayView, defStyle, 0);
            int r = a.getResourceId(0, 0);
            if (r != 0) {
                setOverlay(r);
            }
            this.padOverlay = a.getBoolean(2, false);
            this.padAsBg = a.getBoolean(3, false);
        }
        setWillNotDraw(false);
    }

    public void setOverlay(int resID) {
        setOverlay(getResources().getDrawable(resID));
    }

    public void setPadOverlay(boolean pad) {
        this.padOverlay = pad;
        invalidate();
    }

    @Override // android.view.View
    public void setPressed(boolean pressed) {
        View parent = (View) getParent();
        if (Build.VERSION.SDK_INT > 15 || !parent.isPressed() || isDuplicateParentStateEnabled()) {
            super.setPressed(pressed);
        }
    }

    public void setOverlayPadding(int l, int t, int r, int b) {
        this.padLeft = l;
        this.padTop = t;
        this.padRight = r;
        this.padBtm = b;
    }

    public void setOverlay(Drawable d) {
        if (this.overlay != null) {
            this.overlay.setCallback(null);
        }
        this.overlay = d;
        this.overlay.setCallback(this);
        invalidate();
    }

    @Override // android.view.View
    public void drawableHotspotChanged(float x, float y) {
        super.drawableHotspotChanged(x, y);
        if (Build.VERSION.SDK_INT >= 21 && this.overlay != null) {
            this.overlay.setHotspot(x, y);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchDraw(Canvas c) {
        super.dispatchDraw(c);
        if (this.overlay != null) {
            if (this.padOverlay) {
                this.overlay.setBounds(getPaddingLeft(), getPaddingTop(), c.getWidth() - getPaddingRight(), c.getHeight() - getPaddingBottom());
            } else if (this.padAsBg) {
                Rect r = new Rect();
                if (getBackground() != null && !getBackground().getPadding(r)) {
                    r.set(0, 0, 0, 0);
                }
                this.overlay.setBounds(r.left, r.top, c.getWidth() - r.right, c.getHeight() - r.bottom);
            } else {
                this.overlay.setBounds(this.padLeft, this.padTop, c.getWidth() - this.padRight, c.getHeight() - this.padBtm);
            }
            this.overlay.draw(c);
        }
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable d) {
        return super.verifyDrawable(d) || d == this.overlay;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.overlay != null && this.overlay.isStateful()) {
            this.overlay.setState(getDrawableState());
            postInvalidate();
        }
    }
}
