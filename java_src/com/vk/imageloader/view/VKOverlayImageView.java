package com.vk.imageloader.view;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public class VKOverlayImageView extends VKImageView {
    private Drawable overlay;
    private boolean pad;

    public VKOverlayImageView(Context context) {
        this(context, null);
    }

    public VKOverlayImageView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public VKOverlayImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init(attrs, defStyle);
    }

    private void init(AttributeSet attrs, int defStyle) {
        if (attrs != null) {
            TypedArray a = getContext().obtainStyledAttributes(attrs, R.styleable.OverlayView, defStyle, 0);
            int r = a.getResourceId(0, 0);
            this.pad = a.getBoolean(2, true);
            if (r != 0) {
                setOverlay(r);
            }
        }
        setWillNotDraw(false);
    }

    public void setPadOverlay(boolean p) {
        this.pad = p;
        if (p) {
            updatePadding();
        }
    }

    private void updatePadding() {
        if (this.overlay != null) {
            Rect pad = new Rect();
            this.overlay.getPadding(pad);
            setPadding(pad.left, pad.top, pad.right, pad.bottom);
        }
    }

    @Override // android.view.View
    public void setPressed(boolean pressed) {
        View parent = (View) getParent();
        if (Build.VERSION.SDK_INT > 14 || !parent.isPressed() || isDuplicateParentStateEnabled()) {
            super.setPressed(pressed);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    public void onDraw(Canvas c) {
        c.save();
        c.clipRect(getPaddingLeft(), getPaddingTop(), getWidth() - getPaddingRight(), getHeight() - getPaddingBottom());
        super.onDraw(c);
        c.restore();
        if (this.overlay != null) {
            if (this.pad) {
                this.overlay.setBounds(0, 0, getWidth(), getHeight());
            } else {
                this.overlay.setBounds(getPaddingLeft(), getPaddingTop(), getWidth() - getPaddingRight(), getHeight() - getPaddingBottom());
            }
            this.overlay.draw(c);
        }
    }

    @Override // android.widget.ImageView, android.view.View
    protected boolean verifyDrawable(Drawable d) {
        return super.verifyDrawable(d) || d == this.overlay;
    }

    @Override // android.widget.ImageView, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.overlay != null && this.overlay.isStateful()) {
            this.overlay.setState(getDrawableState());
        }
    }

    public void setOverlay(Drawable d) {
        if (this.overlay != null) {
            this.overlay.setCallback(null);
        }
        this.overlay = d;
        this.overlay.setCallback(this);
        if (this.pad) {
            updatePadding();
        }
        invalidate();
    }

    public void setOverlay(int resID) {
        setOverlay(getResources().getDrawable(resID));
    }
}
