package com.vkontakte.android.ui;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
/* loaded from: classes3.dex */
public class PaddingColorDrawable extends ColorDrawable {
    private int pad;
    private Paint paint;

    public PaddingColorDrawable() {
        this.paint = new Paint();
    }

    public PaddingColorDrawable(int color, int padding) {
        super(color);
        this.paint = new Paint();
        this.pad = padding;
        this.paint.setColor(color);
    }

    @Override // android.graphics.drawable.ColorDrawable
    public void setColor(int color) {
        if (this.paint == null) {
            this.paint = new Paint();
        }
        this.paint.setColor(color);
    }

    @Override // android.graphics.drawable.ColorDrawable, android.graphics.drawable.Drawable
    public void draw(Canvas c) {
        Rect r = copyBounds();
        r.left += this.pad;
        r.right -= this.pad;
        c.drawRect(r, this.paint);
    }
}
