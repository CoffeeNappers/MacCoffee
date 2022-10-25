package com.vkontakte.android.ui.drawable;

import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class PaddingDrawable extends LayerDrawable {
    private boolean boundsChanged;
    private Rect tmpRect;
    private int widthDiff;
    private Drawable wrapped;

    public PaddingDrawable(Drawable wrapped, int wdiff) {
        super(new Drawable[]{wrapped});
        this.tmpRect = new Rect();
        this.boundsChanged = true;
        this.wrapped = wrapped;
        this.widthDiff = wdiff;
    }

    @Override // android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        Rect rect;
        if (this.boundsChanged) {
            this.tmpRect.set(getBounds());
            this.tmpRect.right -= V.dp(14.0f);
            this.tmpRect.left += V.dp(14.0f);
            this.tmpRect.right = (int) (rect.right - (this.widthDiff * (getLevel() / 10000.0f)));
            this.wrapped.setBounds(this.tmpRect);
            this.boundsChanged = false;
        }
        this.wrapped.draw(canvas);
    }

    @Override // android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        super.onBoundsChange(bounds);
        this.boundsChanged = true;
    }

    @Override // android.graphics.drawable.LayerDrawable, android.graphics.drawable.Drawable
    protected boolean onLevelChange(int level) {
        this.boundsChanged = true;
        invalidateSelf();
        return true;
    }
}
