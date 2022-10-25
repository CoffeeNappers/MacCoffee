package com.vk.attachpicker.widget;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import com.vk.core.util.Screen;
/* loaded from: classes2.dex */
public class MapPlaceholderDrawable extends Drawable {
    private Paint linePaint;
    private final int gap = Screen.dp(9);
    private Paint paint = new Paint();

    public MapPlaceholderDrawable() {
        this.paint.setColor(-2172970);
        this.linePaint = new Paint();
        this.linePaint.setColor(-3752002);
        this.linePaint.setStrokeWidth(Screen.dp(9));
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        canvas.drawRect(getBounds(), this.paint);
        int xcount = getBounds().width() / this.gap;
        int ycount = getBounds().height() / this.gap;
        int x = getBounds().left;
        int y = getBounds().top;
        for (int a = 0; a < xcount; a++) {
            canvas.drawLine((this.gap * (a + 1)) + x, y, (this.gap * (a + 1)) + x, getBounds().height() + y, this.linePaint);
        }
        for (int a2 = 0; a2 < ycount; a2++) {
            canvas.drawLine(x, (this.gap * (a2 + 1)) + y, getBounds().width() + x, (this.gap * (a2 + 1)) + y, this.linePaint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return 0;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return 0;
    }
}
