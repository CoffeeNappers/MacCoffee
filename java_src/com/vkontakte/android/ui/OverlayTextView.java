package com.vkontakte.android.ui;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.v4.graphics.drawable.DrawableCompat;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.text.style.ImageSpan;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.drawables.CenteredImageSpan;
/* loaded from: classes3.dex */
public class OverlayTextView extends android.widget.TextView {
    private ColorStateList drawableColorStateList;
    private ImageSpan imageSpan;
    private Drawable leftDrawable;
    private Drawable overlay;
    private boolean padAsBg;
    private int padBtm;
    private int padLeft;
    private boolean padOverlay;
    private int padRight;
    private int padTop;
    private SpannableStringBuilder spannableStringBuilder;

    public OverlayTextView(Context context) {
        this(context, null);
    }

    public OverlayTextView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public OverlayTextView(Context context, AttributeSet attrs, int defStyle) {
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
            this.drawableColorStateList = a.getColorStateList(1);
            Drawable src = a.getDrawable(4);
            a.recycle();
            setSrc(src);
        }
        setWillNotDraw(false);
    }

    public void setSrc(Drawable src) {
        if (src != null) {
            ColorStateList colorsList = this.drawableColorStateList == null ? getTextColors() : this.drawableColorStateList;
            if (colorsList == null) {
                this.leftDrawable = src.mutate();
            } else {
                Drawable drawable = DrawableCompat.wrap(src.mutate());
                DrawableCompat.setTintList(drawable, colorsList);
                this.leftDrawable = drawable;
            }
            this.imageSpan = new CenteredImageSpan(this.leftDrawable);
            setText(getText());
        }
    }

    public void setOverlay(int resID) {
        setOverlay(getResources().getDrawable(resID));
    }

    public void setPadOverlay(boolean pad) {
        this.padOverlay = pad;
        invalidate();
    }

    @Override // android.widget.TextView
    @NonNull
    public Drawable[] getCompoundDrawables() {
        Drawable[] drawables = super.getCompoundDrawables();
        drawables[0] = this.leftDrawable;
        return drawables;
    }

    @Override // android.widget.TextView
    public void setTextColor(ColorStateList colors) {
        super.setTextColor(colors);
        setSrc(this.leftDrawable);
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
    @TargetApi(21)
    public boolean dispatchTouchEvent(MotionEvent event) {
        if (Build.VERSION.SDK_INT >= 21 && this.overlay != null) {
            this.overlay.setHotspot(event.getX(), event.getY());
        }
        return super.dispatchTouchEvent(event);
    }

    @Override // android.widget.TextView, android.view.View
    public void onDraw(Canvas c) {
        super.onDraw(c);
        Matrix m = c.getMatrix();
        float[] mx = new float[9];
        m.getValues(mx);
        c.translate(-mx[2], -mx[5]);
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

    @Override // android.widget.TextView, android.view.View
    protected boolean verifyDrawable(Drawable d) {
        return super.verifyDrawable(d) || d == this.overlay;
    }

    @Override // android.widget.TextView
    public void setText(CharSequence text, TextView.BufferType type) {
        super.setText(getSpannedText(text), type);
    }

    @Override // android.widget.TextView, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        int[] drawableState = getDrawableState();
        if (this.overlay != null && this.overlay.isStateful()) {
            this.overlay.setState(drawableState);
            postInvalidate();
        }
        if (this.leftDrawable != null) {
            this.leftDrawable.setState(drawableState);
            this.leftDrawable.setBounds(0, 0, this.leftDrawable.getIntrinsicWidth(), this.leftDrawable.getIntrinsicHeight());
            postInvalidate();
        }
    }

    private CharSequence getSpannedText(CharSequence text) {
        if (this.imageSpan != null) {
            if (this.spannableStringBuilder == null) {
                this.spannableStringBuilder = new SpannableStringBuilder();
            } else {
                this.spannableStringBuilder.clear();
            }
            String trimmed = text == null ? "" : text.toString().trim();
            if (TextUtils.isEmpty(trimmed)) {
                this.spannableStringBuilder.append((CharSequence) "  ");
                this.spannableStringBuilder.setSpan(this.imageSpan, 1, 2, 17);
            } else {
                this.spannableStringBuilder.append((CharSequence) "   ");
                this.spannableStringBuilder.setSpan(this.imageSpan, 0, 1, 17);
                this.spannableStringBuilder.append(trimmed);
            }
            return this.spannableStringBuilder;
        }
        return text;
    }
}
