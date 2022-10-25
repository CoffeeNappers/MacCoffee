package com.vkontakte.android.ui.drawable;

import android.content.res.ColorStateList;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
/* loaded from: classes3.dex */
public class RecoloredDrawable extends Drawable implements Drawable.Callback {
    private ColorStateList colors;
    private int selectedAlpha;
    private int unselectedAlpha;
    private Drawable wrapped;

    public RecoloredDrawable(Drawable wrap, ColorStateList colors) {
        this.selectedAlpha = 255;
        this.unselectedAlpha = 255;
        this.wrapped = wrap.mutate();
        this.wrapped.setCallback(this);
        this.colors = colors;
        onStateChange(new int[0]);
    }

    public RecoloredDrawable(Drawable wrap, int color) {
        this(wrap, new ColorStateList(new int[][]{new int[0]}, new int[]{color}));
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        this.wrapped.draw(canvas);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int i) {
        this.selectedAlpha = i;
        this.unselectedAlpha = i;
        this.wrapped.setAlpha(i);
    }

    @Override // android.graphics.drawable.Drawable
    public void setBounds(int left, int top, int right, int bottom) {
        super.setBounds(left, top, right, bottom);
        this.wrapped.setBounds(left, top, right, bottom);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return this.wrapped.getOpacity();
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return this.wrapped.getIntrinsicWidth();
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return this.wrapped.getIntrinsicHeight();
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return this.colors.isStateful();
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        super.onStateChange(state);
        int color = this.colors.getColorForState(state, this.colors.getDefaultColor());
        this.wrapped.setColorFilter(color, PorterDuff.Mode.SRC_IN);
        boolean selected = false;
        int i = 0;
        while (true) {
            if (i >= state.length) {
                break;
            } else if (state[i] != 16842913) {
                i++;
            } else {
                selected = true;
                break;
            }
        }
        this.wrapped.setAlpha(selected ? this.selectedAlpha : this.unselectedAlpha);
        return true;
    }

    public int getSelectedAlpha() {
        return this.selectedAlpha;
    }

    public void setSelectedAlpha(int selectedAlpha) {
        this.selectedAlpha = selectedAlpha;
        invalidateSelf();
    }

    public int getUnselectedAlpha() {
        return this.unselectedAlpha;
    }

    public void setUnselectedAlpha(int unselectedAlpha) {
        this.unselectedAlpha = unselectedAlpha;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void invalidateDrawable(Drawable who) {
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void scheduleDrawable(Drawable who, Runnable what, long when) {
        scheduleSelf(what, when);
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void unscheduleDrawable(Drawable who, Runnable what) {
        unscheduleSelf(what);
    }
}
