package com.vkontakte.android.ui;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class PollOptionBackgroundDrawable extends Drawable {
    private RectF rectF = new RectF();
    private Paint paint = new Paint(1);

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        this.rectF.set(getBounds());
        this.paint.setColor(-1182985);
        canvas.drawRoundRect(this.rectF, V.dp(2.0f), V.dp(2.0f), this.paint);
        if (getLevel() > 0) {
            this.rectF.right = this.rectF.left + (this.rectF.width() * (getLevel() / 10000.0f));
            this.paint.setColor(-3219470);
            canvas.drawRoundRect(this.rectF, V.dp(2.0f), V.dp(2.0f), this.paint);
        }
    }

    @Override // android.graphics.drawable.Drawable
    protected boolean onLevelChange(int level) {
        return true;
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return 0;
    }
}
