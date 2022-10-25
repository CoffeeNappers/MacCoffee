package com.vkontakte.android.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class TabletDrawerItemBackgroundDrawable extends Drawable {
    private int widthDiff;
    private RectF tmpRect = new RectF();
    private boolean isSelected = false;
    private Paint paint = new Paint(1);

    public TabletDrawerItemBackgroundDrawable(int wdiff) {
        this.paint.setColor(-13484726);
        this.widthDiff = wdiff;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        if (this.isSelected) {
            this.tmpRect.set(getBounds());
            this.tmpRect.right -= V.dp(14.0f);
            this.tmpRect.left += V.dp(14.0f);
            this.tmpRect.right -= this.widthDiff * (getLevel() / 10000.0f);
            canvas.drawRoundRect(this.tmpRect, V.dp(2.0f), V.dp(2.0f), this.paint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int i) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onLevelChange(int level) {
        invalidateSelf();
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isStateful() {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onStateChange(int[] state) {
        int i = 0;
        this.isSelected = false;
        int length = state.length;
        while (true) {
            if (i >= length) {
                break;
            }
            int s = state[i];
            if (s != 16842913) {
                i++;
            } else {
                this.isSelected = true;
                break;
            }
        }
        invalidateSelf();
        return true;
    }
}
